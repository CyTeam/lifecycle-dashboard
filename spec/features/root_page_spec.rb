require 'spec_helper'

feature 'As not logged in User' do
  scenario 'I see a login form' do
    visit '/'

    expect(page).to have_field 'user[email]'
    expect(page).to have_field 'user[password]'
    expect(page).to have_button 'Sign in'
  end
end

feature 'As a logged in user' do
  include CustomSpecHelpers

  context 'I see on every page' do
    before :all do
      prepare_before_all_tests
    end

    before :each do
      sign_in
      Net::SSH.stub(:start).and_raise("Errno::ENOENT: No such file or directory - getaddrinfo")
    end

    scenario 'a navigation bar' do
      visit '/'
      expect(page).to have_selector '.navbar'
      visit '/projects'
      expect(page).to have_selector '.navbar'
      visit '/projects/new'
      expect(page).to have_selector '.navbar'
      visit '/projects/1/edit'
      expect(page).to have_selector '.navbar'
      visit '/projects/1'
      expect(page).to have_selector '.navbar'
    end

    scenario 'a dashboard link' do
      visit '/'
      expect(page).to have_link 'Dashboard'
      visit '/projects'
      expect(page).to have_link 'Dashboard'
      visit '/projects/new'
      expect(page).to have_link 'Dashboard'
      visit '/projects/1/edit'
      expect(page).to have_link 'Dashboard'
      visit '/projects/1'
      expect(page).to have_link 'Dashboard'
    end

    scenario 'a projects link' do
      visit '/'
      expect(page).to have_link 'Projects'
      visit '/projects'
      expect(page).to have_link 'Projects'
      visit '/projects/new'
      expect(page).to have_link 'Projects'
      visit '/projects/1/edit'
      expect(page).to have_link 'Projects'
      visit '/projects/1'
      expect(page).to have_link 'Projects'
    end

    scenario 'a new project link' do
      visit '/'
      expect(page).to have_link 'New Project'
      visit '/projects'
      expect(page).to have_link 'New Project'
      visit '/projects/new'
      expect(page).to have_link 'New Project'
      visit '/projects/1/edit'
      expect(page).to have_link 'New Project'
      visit '/projects/1'
      expect(page).to have_link 'New Project'
    end

    scenario 'a sign out link' do
      visit '/'
      expect(page).to have_link 'Sign out'
      visit '/projects'
      expect(page).to have_link 'Sign out'
      visit '/projects/new'
      expect(page).to have_link 'Sign out'
      visit '/projects/1/edit'
      expect(page).to have_link 'Sign out'
      visit '/projects/1'
      expect(page).to have_link 'Sign out'
    end
  end
end
