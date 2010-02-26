Integrity
=========

[Integrity](http://integrityapp.com) is your friendly automated Continuous Integration server.

Integrity Web Hooks Notifier
========================

This lets Integrity POST to one or more URLs after a build is completed.

The payload
===========

Each defined URL gets a JSON hash posted to it.
The contents is as follows:

    {
      "project"       => build.project.name, # "integrity-hooks"
      "short_message" => short_message,      # "Built c289a62 successfully"
      "full_message"  => full_message,       # "Build c289a622ee2771ef7f8f1771d67c3c8971d1fcad was successful
                                             #  Commit Message: make it possible to post to several URLs
                                             #  Commit Date: 2009-07-26T15:39:06+02:00
                                             #  Commit Author: Per Christian B. Viken
                                             #
                                             #  Link: ...
                                             #
                                             #  Build Output:
                                             #
                                             #  ...
      "url"           => commit_url          #  ...
    }

Setup Instructions
==================

Add this gem to your `Gemfile`:

    gem "integrity-hooks", "0.0.8"

Then some trickery with the bundler (`bundle unlock && bundle install && bundle pack`).
Finally, in your `init.rb`:

    require "integrity/notifier/hooks"

Now, just edit the project and the configuration should be there
