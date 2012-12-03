task :default => :serial

# cucumber needs this
require "cucumber/rake/task"
Cucumber::Rake::Task.new(:mobile, "Run mobile Cucumber features in serial.") do |t|
  t.cucumber_opts = "features/mobilesearch.feature"
end

Cucumber::Rake::Task.new(:serial, "Run all Cucumber features in serial.")

desc "Run all Cucumber features in parallel."
task :parallel do
  processes = FileList["./features/*.feature"].size
  `parallel_cucumber features/ -n #{processes}`
end
