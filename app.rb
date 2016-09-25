require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load specific routes / controllers
require_relative 'controllers/artists.rb'
require_relative 'controllers/songs.rb'
require_relative 'controllers/playlists'

# Load models
require_relative 'models/artist'
require_relative 'models/song'
require_relative 'models/playlist'

ActiveRecord::Base.logger = Logger.new(STDOUT)

####################
#  General routes  #
####################

get "/" do
  erb :home
end
