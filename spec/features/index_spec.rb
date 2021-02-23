feature 'home page' do
  scenario 'displays list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content("http://makers.tech")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("http://www.google.com")
  end
end
