# config valid for current version and patch releases of Capistrano
lock "~> 3.10.0"

set :application, "rails_cap"
#set :scm, :git
set :repo_url, "https://github.com/sateesh3048/rails_cap"
set :deploy_to, "/var/www/rails_cap"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
server 'rcap.qa.com', user: "deployer", roles: %w{app web db}

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

set :config_files, %w{config/database.yml config/secrets.yml}

set :passenger_restart_with_touch, true

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

  desc "create database if not exists"
  task :create_db do 
    on roles(:db) do 
      execute :rake, "db:create"
    end
  end

  desc "I am saying start it" 
  task :say_start do 
    on roles(:app) do
      puts "GREATE <<<<<<< >>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    end
  end 

  desc "Make sure local git is in sync with remote."
  task :print_msg do 
    on roles(:app) do
      p "I am inside print_msg<<<<<<<<<<<888888888888888"
    end
  end

  desc "checking myself"
  task :check_it do
    on roles(:app) do
      p "Checkinglllllllllllllllllllllllll"
    end
  end

  desc "running seed data"
    task :run_seed  do 
      on roles(:db) do 
        p "I am seeding default data"
      end
    end

  desc "Say by to every one"
  task :say_by do
    on roles(:app) do
      p "Good Byeeeeeeeeeeeeeeeeeeee"
    end
  end

  before :starting, :print_msg
  after :print_msg, :say_start
  after "deploy:migrate", :run_seed
  after :finishing, :check_it
  after :check_it, :say_by
end