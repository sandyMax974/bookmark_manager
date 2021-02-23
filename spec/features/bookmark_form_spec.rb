# frozen_string_literal: true

feature 'add a new bookmark' do
  scenario 'display form and add the new bookmark' do
    visit('/bookmarks')
    click_button('Add')
    visit '/add_bookmark'
    fill_in('bookmark_url', with: 'https://www.disneyplus.com/')
    click_button 'Add'
    expect(page).to have_content('https://www.disneyplus.com/')
  end
end
