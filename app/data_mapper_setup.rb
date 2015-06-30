env = ENV['RACK_ENV'] || 'development'

# checks for current environment from

require 'data_mapper' # get datamapper gem
require 'dm-postgres-adapter'

# DataMapper.setup(:default, "postgres://localhost/bookmark_manager") # tells DataMapper where the databse is on your machine

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/bookmark_manager#{env}')

require './app/models/link' # get application code that will use DM
# require './app/link'
require './app/models/tag'


DataMapper.finalize # finalizes models

DataMapper.auto_upgrade!
