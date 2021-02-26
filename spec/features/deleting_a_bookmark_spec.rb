feature 'deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmarks.add('http://makers.tech', 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://makers.tech')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')  
  end
end
