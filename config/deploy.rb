set :stages, %w(production)     #various environments
load "deploy/assets"                    #precompile all the css, js and images... before deployment..
require "bundler/capistrano"            # install all the new missing plugins...
require 'capistrano/ext/multistage'     # deploy on all the servers..
require "rvm/capistrano"                # if you are using rvm on your server..
require './config/boot'
require 'delayed/recipes'
require "whenever/capistrano"
require 'airbrake/capistrano'


before "deploy:assets:precompile","deploy:config_symlink"
# before "deploy:update_code",    "delayed_job:stop"  # stop the previous deployed job workers...
after "deploy:update", "deploy:cleanup" #clean up temp files etc.
after "deploy:update_code","deploy:migrate"
after "deploy:create_symlink", "deploy:update_crontab"
after "deploy:start",   "delayed_job:start" #start the delayed job
after "deploy:restart", "delayed_job:restart" # restart it..

set :whenever_command, "bundle exec whenever"
set(:application) { "sublet" }
set :delayed_job_args, "-n 2"            # number of delayed job workers
set :rvm_ruby_string, '2.0.0'             # ruby version you are using...
set :rvm_type, :user
server "104.131.19.120", :app, :web, :db, :primary => true
set (:deploy_to) { "/home/deployer/#{application}/#{stage}" }
set :user, 'deployer'
set :keep_releases, 3
set :repository, "git@github.com:mohitjain/sublet.git"

set :use_sudo, false
set :scm, :git
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1

namespace :deploy do
  task :start , :roles => :app, :except => { :no_release => true }  do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :stop do ; end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :config_symlink do
    run "ln -sf #{shared_path}/database.yml #{release_path}/config/database.yml"
  end

  task :update_crontab, :roles => :db do
   run "cd #{release_path} && bundle exec whenever --update-crontab #{application}"
  end
end


