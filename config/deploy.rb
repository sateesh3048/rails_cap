# config valid for current version and patch releases of Capistrano
lock "~> 3.10.0"

set :application, "rails_cap"
set :scm, :git
set :repo_url, "https://github.com/sateesh3048/rails_cap"
 set :deploy_to, "/var/www/rails_cap"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
server '127.0.0.1', user: "deployer", roles: %w{app web db}

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
namespace :deploy do 
  desc "Make sure local git is in sync with remote."
  task :print_msg do 
    on roles(:app) do
      p "I am inside print_msg<<<<<<<<<<<888888888888888"
    end
  end
  desc "This is clean up task"
  task :clean_up do 
    on roles(:app) do 
       p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    end
  end
  before :starting, :print_msg
  after :finishing, :clean_up
end