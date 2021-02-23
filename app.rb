# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  get '/add_bookmark' do
    erb :bookmark_form
  end

  post '/add_bookmark/add' do
    site = params['bookmark_url']
    Bookmarks.add(site)
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
