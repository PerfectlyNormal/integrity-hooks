Gem::Specification.new do |s|
  s.name              = "integrity-hooks"
  s.version           = "0.0.7"
  s.date              = "2010-02-26"
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
]
  s.add_dependency "integrity"
  s.add_dependency "json"
end
