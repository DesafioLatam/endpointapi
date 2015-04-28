# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'endpointapi'
set :scm, :git
set :repo_url, 'git@github.com:DesafioLatam/endpointapi.git'
set :branch, 'master'
set :deploy_via, :copy
set :user, 'deploy'

set :deploy_to, '/home/deploy/endpointapi'
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do

    end
  end

end
