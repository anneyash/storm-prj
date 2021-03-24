# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "storm"
set :repo_url, "git@github.com:anneyash/storm.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
ask :branch, 'master'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deployer/storm"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml' # '.env',

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'public/assets', '.bundle', 'tmp/cache', 'tmp/sockets' # , 'node_modules', 'public/packs',

set :rvm_ruby_version, "ruby-2.5.1@storm"
set :rvm_type, :user
set :use_sudo, false
set :keep_releases, 5

bundle_bins = fetch(:bundle_bins, [])
bundle_bins += %w(ruby puma rake)
set :bundle_bins, bundle_bins

# after 'bundler:install', 'db:migrate'
# TODO:
# after 'deploy:symlink:release', 'puma:restart'

# namespace :deploy do

  # after :publishing, :restart

  # task :restart do
  #   invoke 'unicorn:restart'
  #   invoke 'delayed_job:restart'
  # end
  #
  # task :hard_restart do
  #   invoke 'unicorn:stop'
  #   invoke 'unicorn:start'
  #   invoke 'delayed_job:stop'
  #   invoke 'delayed_job:restart'
  # end
  #
  # after :finishing, 'deploy:cleanup'
  #after :finished, "airbrake:deploy"
# end

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
