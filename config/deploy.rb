set :rvm_ruby_string, 'ruby-1.9.3-p194@global'
require "rvm/capistrano"
set :application, "specerija"
set :repository,  "/Users/mrbrdo/rails/specerija"
set :copy_strategy, :export
set :deploy_via, 'copy'
set :user, 'mrbrdo'
set :use_sudo, false
set :ssh_options, { :forward_agent => true }
ssh_options[:paranoid] = false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


role :web, "10.21.3.29"                          # Your HTTP server, Apache/etc
role :app, "10.21.3.29"                          # This may be the same as your `Web` server
role :db,  "10.21.3.29", :primary => true # This is where Rails migrations will run
# role :db,  "10.21.3.29"

set :deploy_to, '/home/mrbrdo/specerija'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end