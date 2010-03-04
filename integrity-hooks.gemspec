Gem::Specification.new do |s|
  s.name              = "integrity-hooks"
  s.version           = "0.0.9"
  s.date              = "2010-03-04"
  s.summary           = "Web hooks notifier for the Integrity continuous integration server"
  s.homepage          = "http://eastblue.org/projects/integrity"
  s.email             = "perchr@northblue.org"
  s.authors           = ["Per Christian B. Viken"]
  s.has_rdoc          = false
  s.files             = %w[
ChangeLog
TODO
LICENSE
README.markdown
Rakefile
integrity-hooks.gemspec
lib/integrity/notifier/hooks.rb
]
  s.add_dependency "integrity"
  s.add_dependency "json"
end
