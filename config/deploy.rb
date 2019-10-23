lock '~> 3'

set :application, 'fufast'
set :repo_url, 'git@github.com:luckypike/fufast.git'
set :branch, ENV['BRANCH'] || 'master'

set :deploy_to, '/home/fufayka/apps/fufast'

append :linked_files, 'config/database.yml', 'config/master.key'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

set :keep_releases, 5

set :ssh_options, forward_agent: true
