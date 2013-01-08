task default: :serial

# cucumber needs this
require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:serial, 'Run all Cucumber features in serial.') do |t|
  t.profile = 'ci'
end

def processes
  FileList['./features/*.feature'].size
end

desc 'Run all Cucumber features in parallel.'
task :parallel do
  `parallel_cucumber features/ -n #{processes} --test-options '--profile ci'`
end

def run_tests(browser)
  `parallel_cucumber features/ -n #{processes} --test-options '--profile #{browser}'`
end

desc 'Run all Cucumber features in parallel, do not run tests that have known bugs in IE6.'
task :ie6 do |t|
  run_tests(t.name)
end

desc 'Run all Cucumber features in parallel, do not run tests that have known bugs in IE7.'
task :ie7 do |t|
  run_tests(t.name)
end

desc 'Run all Cucumber features in parallel, do not run tests that have known bugs in IE8.'
task :ie8 do |t|
  run_tests(t.name)
end

desc 'Run all Cucumber features in parallel, do not run tests that have known bugs in IE9.'
task :ie9 do |t|
  run_tests(t.name)
end

desc 'Run all Cucumber features in parallel, do not run tests that have known bugs in IE10.'
task :ie10 do |t|
  run_tests(t.name)
end
