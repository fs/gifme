credentials = YAML.load(File.new(Rails.root.join('config/database.yml')))[Rails.env]
credentials = credentials.with_indifferent_access

credentials.default_proc = proc do |hash, key|
  raise "#{key} is need to be defined in " <<
    "config/database.yml for the stable connection with db; " <<
    "Please, check #{Rails.env} environment setups."
end

'adapter://user:password@hostname/database'
DataMapper.setup :default,
  "#{credentials[:adapter]}://" <<
  "#{credentials[:username]}:" <<
  "#{credentials[:password]}@" <<
  "#{credentials[:host]}/" <<
  "#{credentials[:database]}"


DataMapper::Property.allow_nil(false)
