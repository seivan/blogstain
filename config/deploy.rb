set :application, "blogstain"
set :user, "seivan"
default_run_options[:pty] = true

set :repository,  "git@github.com:seivan/blogstain.git"
ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_to, "/var/www/apps/#{application}"

set :scm, :git 
#:scm, :subversion # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :domain, "debby.zapto.org"
role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain  #"your app-server here"                          # This may be the same as your `Web` server
#role :db,  domain  #"your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,   domain, :primary => true  #"your slave db-server here"
set :scm_username, user
set :runner, user

set :rails_env, "production"
# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end