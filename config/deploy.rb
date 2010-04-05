set :application, "blogstain"
set :user, "seivan"
set :domain, "debby.zapto.org"
role :web, domain      
role :app, domain  
role :db,   domain, :primary => true
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :scm, "git"
set :scm_username, user
set :runner, user
set :rails_env, "production"
set :repository,  "git@github.com:seivan/blogstain.git"
set :deploy_to, "~/#{application}"
set :branch, "master"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1

namespace :deploy do
  desc "Restart the server (Passenger) - need to change to unicorn+nginx"
  task :start do
    run "touch #{current_path}/tmp/restart.txt"
  end
  desc "Symlink shared configs and folders on each release"
  task :symlink_shared do 
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config.database.yml"
  end
  desc "Sync the public/assets directory"
  # task :pictures do 
  #   system "scp -r pictures #{user}@#{domain}:#{release_path}/public/images"
  # end
end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

#After deploy, run symlink_shared
after 'deploy:updated_code', 'deploy:symlink_shared'