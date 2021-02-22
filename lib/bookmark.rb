require 'pg'

class Bookmarks

  attr_reader :list

  def initialize
    @list = []
    db_retrieve
  end
  
  def all
    @list.join('<br>')
  end

  def db_retrieve
    # @list.join('<br>')
    begin
      con = PG.connect :dbname => 'bookmark_manager', :user => 'peterallen'
      rs = con.exec 'SELECT * FROM bookmarks;'
      rs.each do |row| 
       @list << row['url']
      end
      
    rescue PG::Error => e
      puts e.message 
        
    ensure
      con.close if con
      
    end

  end

end