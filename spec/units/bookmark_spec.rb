require 'bookmark'

describe Bookmarks do
  describe '.all' do
    it 'should return a list of bookmarks' do
      connection = PG.connect :dbname => 'bookmark_manager_test'
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://makers.tech');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      expect(Bookmarks.all).to eq(['http://makers.tech', 'http://www.destroyallsoftware.com', 'http://www.google.com'])
    end
  end
end
