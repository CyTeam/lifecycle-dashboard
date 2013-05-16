require 'spec_helper'

feature 'As a logged in user' do
  include CustomSpecHelpers

  context 'I see an index page' do
    before :all do
      prepare_before_all_tests
    end

    before :each do
      sign_in

      visit '/projects/1'
    end

    scenario 'with a table' do
      expect(page).to have_selector 'table'
    end

    scenario 'with a table header contains "Title", "Project manager" and "Repository", "Hosts", "Project source state", "Project overall state"' do
      within 'table' do
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Project manager'
        expect(page).to have_content 'Repository'
        expect(page).to have_content 'Hosts'
        expect(page).to have_content 'Project source state'
        expect(page).to have_content 'Project overall state'
      end
    end

    scenario 'with a table contains a Project' do
      within 'table' do
        expect(page).to have_content 'bookyt'
        expect(page).to have_content 'simon'
        expect(page).to have_link 'simon@example.com'
        expect(page).to have_content 'git@github.com:huerlisi/bookyt.git'
        expect(page).to have_content 'bookyt.ch'
        expect(page).to have_content 'Newest, secure code'
        expect(page).to have_content 'good'
        expect(page).to have_content 'good'
      end
    end

    scenario 'within a field contains simon@example.com as link to email him' do
      within 'table, tbody, tr' do
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

    scenario 'with a "Project source state" within a label' do
      within 'table, tr', :text => 'Project source state'  do
        expect(page).to have_selector '.label'
        expect(page).to have_selector '.label-success'
        expect(page).to have_content 'good'
      end
    end

    scenario 'with a "Project overall state" within a label' do
      within 'table, tr', :text => 'Project overall state'  do
        expect(page).to have_selector '.label'
        expect(page).to have_selector '.label-success'
        expect(page).to have_content 'good'
      end
    end

    scenario 'with edit link to be styled as button' do
      expect(page).to have_link 'Edit' do |link|
        expect(link).to have_selector '.btn'
      end
    end

    scenario 'with a link to edit the project' do
      expect(page).to have_link 'Edit'
      click_link 'Edit'
      current_path.should === '/projects/1/edit'
    end

    scenario 'with s list link to be styled as button' do
      expect(page).to have_link 'List' do |link|
        expect(link).to have_selector '.btn'
      end
    end

    scenario 'with a link to see all projects' do
      expect(page).to have_link 'List'
      click_link 'List'
      current_path.should === '/projects'
    end
  end
end
