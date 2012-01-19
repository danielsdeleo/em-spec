spec = Gem::Specification.new do |s|
  s.name = 'em-spec'
  s.version = '0.1.3'
  s.date = '2009-04-20'
  s.summary = 'Bacon based BDD API for Ruby/EventMachine'
  s.email = "em-spec@tmm1.net"
  s.homepage = "http://github.com/tmm1/em-spec"
  s.description = 'Rspec and Bacon based BDD API for Ruby/EventMachine'
  s.has_rdoc = false
  s.authors = ["Aman Gupta", "Lourens Naudé", "Daniel DeLeo"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_dependency('eventmachine', '>= 0.12.6')
  s.add_dependency('bacon', '>= 1.1.0')
  s.add_dependency('rspec', '>= 1.1.12')

  s.add_development_dependency('rake')
end
