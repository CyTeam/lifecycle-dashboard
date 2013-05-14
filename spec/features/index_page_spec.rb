require 'spec_helper'

feature 'As a logged in user' do
  include CustomSpecHelpers

  context 'I see an index page' do
    before :all do
      prepare_before_all_tests
    end

    before :each do
      sign_in
    end

    scenario 'with a table of all projects' do
      expect(page).to have_selector('table')
    end

    scenario 'with a heading for title' do
      within 'table' do
        expect(page).to have_content 'Title'
      end
    end

    scenario 'with a heading for project manager' do
      within 'table' do
        expect(page).to have_content 'Project manager'
      end
    end

    scenario 'with a heading for hosts' do
      within 'table' do
        expect(page).to have_content 'Hosts'
      end
    end

    scenario 'with a project within a table row' do
      within '.project' do
        expect(page).to have_content 'bookyt'
        expect(page).to have_content 'simon'
        expect(page).to have_content 'bookyt.ch'
        expect(page).to have_link 'Detail'
      end
    end

    scenario 'with a field contains a title' do
      within 'table' do
        expect(page).to have_content 'bookyt'
      end
    end

    scenario 'with a field contains a project manager' do
      within 'table' do
        expect(page).to have_content 'simon'
      end
    end

    scenario 'within the project manager field is a link to email him' do
      within 'table' do
        expect(page).to have_link 'simon@example.com'
        expect(page).to have_xpath '//a[contains(@href, email)]'
      end
    end

    scenario 'with a field contains a host' do
      within 'table' do
        expect(page).to have_content 'bookyt.ch'
      end
    end

    scenario 'with a link to show the details about a project' do
      within 'table' do
        expect(page).to have_link 'Detail'
      end
    end
  end
end
