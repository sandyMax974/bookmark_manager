require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmarks.new
    p @bookmarks.all
    erb :bookmarks
  end

  run! if app_file == $0
end
