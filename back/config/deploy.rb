# config valid for current version and patch releases of Capistrano
lock '3.16.0'

set :application, 'engidoor'
set :repo_url, 'git@github.com:kkumaki12/engidoor.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/engidoor
set :deploy_to, '/var/www/rails/engidoor'
# バージョンが変わっても共通で参照するディレクトリ
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads'
append :linked_files, 'config/database.yml', 'config/master.key'
# Default value for :format is :airbrussh.
# set :format, :airbrussh
set :rbenv_type, :user
set :rbenv_custom_path, '/home/kensuke/.rbenv'
set :rbenv_ruby, '3.0.0'
# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true
set :branch, ENV['BRANCH'] || 'master'
# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
set :ssh_options,  auth_methods: ['publickey'],
                   keys: ['~/.ssh/engidoor_key_rsa']
# プロセス番号を記載したファイルの場所
set :puma_pid, 'var/www/rails/engidoor/tmp/pids/puma.pid'

# puma設定ファイルの場所
set :puma_conf, '/var/www/rails/engidoor/config/puma/production.rb'
