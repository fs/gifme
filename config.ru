# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Gifme::Application

if Rails.env.production?
  DelayedJobWeb.use Rack::Auth::Basic do |username, password|
    username == ENV['DELAYED_JOB_USER'] && password == ENV['DELAYED_JOB_PASSWORD']
  end
end
