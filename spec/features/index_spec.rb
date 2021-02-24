# frozen_string_literal: true

feature 'viewing bookmarks' do
  scenario 'displays list of bookmarks' do
    Bookmarks.add('http://makers.tech', 'Makers Academy')
    Bookmarks.add('http://www.destroyallsoftware.com', 'Destroy All Software')
    Bookmarks.add('http://www.google.com', 'Google')

    visit '/bookmarks'

    expect(page).to have_link('Makers Academy', href: 'http://makers.tech')
    expect(page).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
