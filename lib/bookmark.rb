class Bookmarks

  attr_reader :list

  def initialize
    @list = ['Google','Makers','Codewars']
  end

  def all
    @list.join('<br>')
  end

end