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
    Bookmarks.add(url = params['url'], title = params['title'])
    # p bookmark
    # Bookmarks.add(url: params['url'], title: params['title']) # walkthrough method
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
