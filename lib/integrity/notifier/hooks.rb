require "json"
require "net/http"
require "net/https"

module Integrity
  class Notifier
    class Hooks < Notifier::Base
      attr_reader :uri

      def self.to_haml
        <<-HAML
%p.normal
  %label{ :for => "hooks_notifier_uri" } Send to
  To send to multiple URLs, separate the URLs with three stars (***)
  %input.text#hooks_notifier_uri{                        |
    :name => "notifiers[Hooks][uri]",                    |
    :type => "text",                                     |
    :value => config["uri"] || ""}                       |
        HAML
      end

      def initialize(build, config={})
        @uri = config.delete("uri")
        super
      end

      def deliver!
        uri.split("***").each do |target|
          begin
            Timeout.timeout(5) do
              Integrity.log("POSTing to #{target}")
              response = Net::HTTP.post_form(URI.parse(target), {"payload" => payload.to_json})
              case response
              when Net::HTTPSuccess
                Integrity.log("POST to #{target} successful. Response: #{response.body}")
                true
              else
                # TODO: N retries
                Integrity.log("POST to #{target} failed (#{response.code} #{response.msg}). Response: \n#{response.body}")
                false
              end
            end
          rescue Errno::ECONNREFUSED
            Integrity.log("Connection refused for #{target}")
          rescue TimeoutError
            Integrity.log("Timed out POST to #{target}")
          end
        end
      end

      def payload
        {
          "project"       => build.project.name,
          "short_message" => short_message,
          "full_message"  => full_message,
          "url"           => commit_url
        }
      end
    end

    register Hooks
  end
end
