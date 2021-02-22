require 'bookmark'

describe Bookmarks do
  it 'returns a list of bookmarks' do
    expect(subject.list).to eq(['Google','Makers','Codewars'])
  end

  it 'should return a string of bookmarks' do
    expect(subject.all).to eq('Google<br>Makers<br>Codewars')
  end
end