# frozen_string_literal: true

feature 'viewing bookmarks' do
  scenario 'displays list of bookmarks' do
    Bookmarks.add('http://makers.tech')
    Bookmarks.add('http://www.destroyallsoftware.com')
    Bookmarks.add('http://www.google.com')

    visit '/bookmarks'

    expect(page).to have_content('http://makers.tech')
    expect(page).to have_content('http://www.destroyallsoftware.com')
    expect(page).to have_content('http://www.google.com')
  end
end
