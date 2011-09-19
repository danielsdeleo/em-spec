task :gem => :gemspec do
  sh 'gem build em-spec.gemspec'
end

task :gemspec do

end

task :install => :gem do
  sh 'sudo gem install em-spec-*.gem'
end

task :default => :spec

task :spec do
  sh 'bacon test/bacon_spec.rb'
  sh 'rspec -f documentation test/rspec_spec.rb test/rspec_fail_examples.rb'
end
