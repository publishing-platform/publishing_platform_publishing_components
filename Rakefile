require "bundler/setup"
require "rubocop/rake_task"
require "rspec/core/rake_task"
APP_RAKEFILE = File.expand_path("spec/dummy/Rakefile", __dir__)

load "rails/tasks/engine.rake"
load "rails/tasks/statistics.rake"

require "bundler/gem_tasks"

RuboCop::RakeTask.new
RSpec::Core::RakeTask.new

namespace :assets do
  desc "Test precompiling assets through dummy application"
  task precompile: :environment do
    Rake::Task["app:assets:precompile"].invoke
  end

  desc "Test cleaning assets through dummy application"
  task clean: :environment do
    Rake::Task["app:assets:clean"].invoke
  end

  desc "Test clobbering assets through dummy application"
  task clobber: :environment do
    Rake::Task["app:assets:clobber"].invoke
  end
end

desc "Build the Sass files"
task dartsass: :environment do
  Rake::Task["app:dartsass:build"].invoke
end

desc "Linting for Ruby, JS and SASS"
task lint: %i[rubocop environment] do
  sh "yarn run lint"
end

task default: %i[dartsass lint spec]