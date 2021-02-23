require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  run! if app_file == $0
end
