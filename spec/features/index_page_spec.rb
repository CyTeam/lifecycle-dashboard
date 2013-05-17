require 'spec_helper'

feature 'As a logged in user' do
  include CustomSpecHelpers

  context 'I see an index page' do
    before :all do
      prepare_before_all_tests
    end

    before :each do
      sign_in

      Net::SSH.stub(:start).and_raise("Errno::ENOENT: No such file or directory - getaddrinfo")
    end

    scenario 'with a heading "Listing projects"' do
      expect(page).to have_content 'Listing projects'
    end

    scenario 'with a table' do
      expect(page).to have_selector 'table'
    end

    scenario 'with a table header contains "Title", "Project manager" and "Hosts"' do
      within 'table' do
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Project manager'
        expect(page).to have_content 'Hosts'
      end
    end

    scenario 'with a table row contains a Project' do
      within 'table' do
        expect(page).to have_selector '.project'
        expect(page).to have_content 'bookyt'
        expect(page).to have_content 'simon'
        expect(page).to have_link 'simon@example.com'
        expect(page).to have_content 'bookyt.ch'
        expect(page).to have_content 'Newest, secure code'
        expect(page).to have_link 'Detail'
      end
    end

    scenario 'with a field contains simon@example.com as link to email him' do
      within 'table' do
        expect(page).to have_link 'simon@example.com'
        expect(page).to have_xpath './/a[@href="mailto:simon@example.com"]'
      end
    end

    scenario 'with a deployment state within a label' do
      within 'table' do
        expect(page).to have_selector '.label'
        expect(page).to have_selector '.label-success'
        expect(page).to have_content 'Newest, secure code'
      end
    end

    scenario 'with a link to show the details about a project' do
      within 'table' do
        expect(page).to have_link 'Detail'
        click_link 'Detail'
      end
      current_path.should === '/projects/1'
    end
  end
end
