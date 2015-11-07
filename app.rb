require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'rqrcode'
require 'base64'
require 'geokit'
require 'googlestaticmap'
require 'require_all'

require_all 'models'
require_all 'controllers'

set :port, 4567
set :bind, '0.0.0.0'

set :servername, "localhost:4567"

after do 
  ActiveRecord::Base.clear_active_connections!
  ActiveRecord::Base.connection.close
end
