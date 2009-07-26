Gem::Specification.new do |s|
  s.name              = "integrity-hooks"
  s.version           = "0.0.2"
  s.date              = "2009-07-26"
  s.summary           = "Web hooks notifier for the Integrity continuous integration server"
  s.homepage          = "http://eastblue.org/projects/integrity"
  s.email             = "perchr@northblue.org"
  s.authors           = ["Per Christian B. Viken"]
  s.has_rdoc          = false
  s.files             = %w[
LICENSE
README.markdown
Rakefile
integrity-hooks.gemspec
lib/integrity/notifier/hooks.rb
test/integrity_hooks_test.rb
]
  s.test_files        = %w[test/integrity_hooks_test.rb]
  s.add_dependency "integrity"
  s.add_dependency "json"
end
