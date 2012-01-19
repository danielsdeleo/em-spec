task :gem => :gemspec do
  sh 'gem build em-spec.gemspec'
end

task :gemspec do

end

task :install => :gem do
  sh 'sudo gem install em-spec-*.gem'
end

task :default => [:bacon, :spec]

desc "Run Bacon spec"
task :bacon do
  sh 'bundle exec bacon test/bacon_spec.rb'
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["--format documentation", "--color"]
  t.pattern = "./spec/**/*_spec.rb"
end
