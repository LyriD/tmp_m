role :app, %w(hosting_lyrs@fluorine.locum.ru)
role :web, %w(hosting_lyrs@fluorine.locum.ru)
role :db, %w(hosting_lyrs@fluorine.locum.ru)

set :ssh_options, forward_agent: true
set :rails_env, :production
