# frozen_string_literal: true

feature 'add a new bookmark' do
  scenario 'display form and add the new bookmark' do
    visit('/bookmarks')
    click_on("add")

    visit '/bookmarks/new' # why can't I remove this step?

    fill_in("title", with: 'Disney +')
    fill_in("url", with: 'https://www.disneyplus.com/')
    click_button 'Add'

    expect(page).to have_link('Disney +', href: 'https://www.disneyplus.com/')
  end
end
