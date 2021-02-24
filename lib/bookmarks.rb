# frozen_string_literal: true

require 'pg'

class Bookmarks
  attr_reader :list

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect dbname: 'bookmark_manager_test'
                 else
                   PG.connect dbname: 'bookmark_manager'
                 end
    results = connection.exec 'SELECT * FROM bookmarks;'
    results.map { |row| row['url'] }
  end

  def self.add(url, title) # why are we passing key-value pairs
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect dbname: 'bookmark_manager_test'
                 else
                   PG.connect dbname: 'bookmark_manager'
                 end
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title") # why are we returning this?
  end
end
