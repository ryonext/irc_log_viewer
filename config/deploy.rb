lock '3.5.0'

set :application, 'irc_log_viewer'
set :repo_url, 'git@github.com:ryonext/irc_log_viewer.git'

set :rbenv_type, :user
set :rbenv_ruby, "2.3.1"

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end
