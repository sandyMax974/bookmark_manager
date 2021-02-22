feature 'home page' do
  scenario 'displays list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content("Google")
    expect(page).to have_content("Makers")
    expect(page).to have_content("Codewars")
  end
end