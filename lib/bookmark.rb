require 'pg'

class Bookmarks

  attr_reader :list

  def self.all
    connexion = PG.connect :dbname => 'bookmark_manager'
    results = connexion.exec 'SELECT * FROM bookmarks;'
    results.map { |row| row['url'] }
  end

end
