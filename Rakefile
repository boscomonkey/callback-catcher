#!/usr/bin/env rake -*-ruby-*-
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

CallbackCatcher::Application.load_tasks

if %w(development test).include?(Rails.env)
  desc "run annotate on all models"
  task :annotate do
    sh "annotate --sort -i -e tests,fixtures"
  end
end
