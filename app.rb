require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'require_all'

require_all 'models'
require_all 'controllers'

set :port, 4567
set :bind, '0.0.0.0'

set :servername, "localhost:4567"
