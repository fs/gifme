require "bundler/capistrano"
require "delayed/recipes"

server "198.211.125.194", :web, :app, :db, primary: true

set :rails_env, "production"
set :user, "deployer"
set :application, "gifme"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:fs/#{application}.git"
set :branch, "deploy-to-vps"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :default_environment, {
  'PATH' => '/opt/rbenv/shims:/opt/rbenv/bin:$PATH'
}

namespace :unicorn do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn"
    task command, roles: :app do
      run "service unicorn_#{application} #{command}"
    end
    after "deploy:#{command}", "unicorn:#{command}"
  end
end

%w[start stop restart].each do |command|
  after "deploy:#{command}", "delayed_job:#{command}"
end
