require 'spec_helper'

feature 'As not logged in User' do
  scenario 'I see a login form' do
    visit '/'

    expect(page).to have_field 'user[email]'
    expect(page).to have_field 'user[password]'
    expect(page).to have_button 'Sign in'
  end
end




