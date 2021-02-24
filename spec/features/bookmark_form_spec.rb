# frozen_string_literal: true

feature 'add a new bookmark' do
  scenario 'display form and add the new bookmark' do
    visit('/bookmarks')
    click_button('Add')
    visit '/add_bookmark'
    fill_in('url', with: 'https://www.disneyplus.com/')
    fill_in('title', with: 'Disney +')
    click_button 'Add'

    expect(page).to have_link('Disney +', href: 'https://www.disneyplus.com/')
  end
end
