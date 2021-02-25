require 'bookmark'

describe Bookmark do
  let(:my_bookmark) { Bookmark.new(123,'Test website', 'http://www.testsite.com') }

  describe '#id' do
    it 'knows its ID' do
      expect(my_bookmark.id).to eq 123
    end
  end
  describe '#title' do
    it 'knwos its title' do
      expect(my_bookmark.title).to eq 'Test website'
    end
  end
  describe '#url' do
    it 'knwos its url' do
      expect(my_bookmark.url).to eq 'http://www.testsite.com'
    end
  end
end
