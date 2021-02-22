#!/usr/bin/ruby

require 'pg'

begin

    con = PG.connect :dbname => 'bookmark_manager', :user => 'peterallen'

    con.exec "INSERT INTO bookmarks VALUES(5, 'www.ebay.com')"
    rs = con.exec 'SELECT * FROM bookmarks;'

    rs.each do |row| 
      puts row
    end
    
rescue PG::Error => e

    puts e.message 
    
ensure

    con.close if con
    
end