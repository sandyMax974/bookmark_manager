require 'bookmark'

describe Bookmarks do
  describe '.all' do
    it 'should return a string of bookmarks' do
      expect(Bookmarks.all).to eq(['http://makers.tech', 'http://www.destroyallsoftware.com', 'http://www.google.com'])
    end
  end
end
