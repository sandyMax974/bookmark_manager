# frozen_string_literal: true

require 'bookmarks'

describe Bookmarks do
  describe '.all' do
    # it 'should return a list of bookmarks' do
    #   connection = PG.connect dbname: 'bookmark_manager_test'
    #   connection.exec("INSERT INTO bookmarks (url) VALUES('http://makers.tech');")
    #   connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    #   connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    #
    #   expect(Bookmarks.all).to eq(['http://makers.tech', 'http://www.destroyallsoftware.com', 'http://www.google.com'])
    # end

    it 'should return a bookmark object' do
      Bookmarks.add('http://makers.tech', 'Makers Academy')
      Bookmarks.add('http://www.google.com', 'Google')

      expect(Bookmarks.all).to all be_an_instance_of Bookmark
    end
  end

  describe '.add' do
    # it 'creates a new bookmark' do
    #   site = 'https://www.disneyplus.com/'
    #   Bookmarks.add(site)
    #   expect(Bookmarks.all).to include(site)
    # end
    # it 'creates the new bookmark as a hash' do
    #   bookmark = Bookmarks.add('http://www.testbookmark.com', 'Test Bookmark')
    #   expect(bookmark['url']).to eq 'http://www.testbookmark.com'
    #   expect(bookmark['title']).to eq 'Test Bookmark'
    # end
    it 'return the new bookmark as a Bookmark object' do
      bookmark = Bookmarks.add('http://www.testbookmark.com', 'Test Bookmark')
      # What is the step below for?
      # persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark).to be_an_instance_of Bookmark
    end
  end
end
