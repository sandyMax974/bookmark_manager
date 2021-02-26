feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmarks.add('http://makers.tech', 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://makers.tech')

    first('.bookmark').click_button('Update')
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('updated_title', with: 'Google')
    fill_in('updated_url', with: 'http://www.goole.com/')
    click_button 'update'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Google', href: 'http://www.goole.com/')
  end
end
