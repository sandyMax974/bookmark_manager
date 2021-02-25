# frozen_string_literal: true
require 'pg'
require_relative 'bookmark'

class Bookmarks
  attr_reader :list

  def self.all # this methode returns an array of Bookmark obj
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect dbname: 'bookmark_manager_test'
                 else
                   PG.connect dbname: 'bookmark_manager'
                 end
    results = connection.exec 'SELECT * FROM bookmarks;'
    results.map { |row| Bookmark.new(row['id'], row['title'], row['url']) }
  end

  def self.add(url, title) # this method return a hash thanks to the RETURNING syntax 
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect dbname: 'bookmark_manager_test'
                 else
                   PG.connect dbname: 'bookmark_manager'
                 end
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
  end
end
