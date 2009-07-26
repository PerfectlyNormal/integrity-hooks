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
  %label{ :for => "irc_notifier_uri" } Send to
  To send to multiple URLs, separate the URLs with three stars (***)
  %input.text#irc_notifier_uri{                          |
    :name => "notifiers[Hooks][uri]",                    |
    :type => "text",                                     |
    :value => config["uri"] }                            |
        HAML
      end

      def initialize(build, config={})
        @uri = config.delete("uri")
        super
      end

      def deliver!
        uri.split("***").each do |target|
          Net::HTTP.post_form(URI.parse(target), {"payload" => payload.to_json})
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
