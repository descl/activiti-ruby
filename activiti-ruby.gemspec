Gem::Specification.new do |s|
  s.name = "activiti-ruby"
  s.version = "0.0.2"
  s.date = "2012-08-08"
  s.summary = "Activiti Ruby library"
  s.email = "descl@zouig.org"
  s.homepage = "https://github.com/descl/activiti-ruby"
  s.description = "A Ruby library to interact with an activiti instance (a BPM engine), see http://activiti.org/"
  s.has_rdoc = true
  s.authors = ['Christophe Desclaux']
  s.files = ["README", "activiti-ruby.gemspec", "lib", "examples", "lib/activiti-ruby.rb", "lib/activiti/activiti_api.rb"]  
  s.add_dependency("rest-client", "~> 1.6.7")
end