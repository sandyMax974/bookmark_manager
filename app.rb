# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    # print "@bookmarks = #{@bookmarks}"
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :bookmark_form
  end

  post '/bookmarks' do
    Bookmarks.add(url = params['url'], title = params['title'])
    # p bookmark
    # Bookmarks.add(url: params['url'], title: params['title']) # walkthrough method
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    # p params
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("DELETE FROM bookmarks WHERE id = #{params['id']}")
    Bookmarks.delete(id = params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    puts "GET request to edit.erb (app.rb)"
    p params
    @bookmark_id = params[:id]
    erb :edit
  end

  patch 'bookmarks/:id' do # something is breaking somewhere here
    @bookmark_id = params[:id]
    @bookmark_title = params['updated_title']
    @bookmark_url = params['updated_url']
    puts 'PATCH request (app.rb)'
    p params

    connection = PG.connect dbname: bookmark_manager_test
    connection.exec("UPDATE bookmarks SET title = '#{@bookmark_title}', url = '#{@bookmark_url}' WHERE id = #{@bookmark_id}") # RETURNING id, url, title")

    redirect('/bookmarks')
  end

  run! if app_file == $0
end
