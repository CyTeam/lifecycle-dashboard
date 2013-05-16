require 'spec_helper'

feature 'As a logged in user' do
  include CustomSpecHelpers

  context 'I see a new form' do
    before :all do
      prepare_before_all_tests
    end

    before :each do
      sign_in

      visit 'projects/new'
    end

    scenario 'with labels for each input with "Title", "Project manager", "Project manager email", "Repository", "Host name", "Deployment state", "Delete checkbox for hosts", "Ruby version", "Ruby project source", "Rails version", "Rails project source", "Json version", "Json project source"' do
      within 'form' do
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Project manager'
        expect(page).to have_content 'Project manager email'
        expect(page).to have_content 'Repository'
        expect(page).to have_content 'Host name'
        expect(page).to have_content 'Deployment state'
        expect(page).to have_content 'Ruby version'
        expect(page).to have_content 'Ruby project source'
        expect(page).to have_content 'Rails version'
        expect(page).to have_content 'Rails project source'
        expect(page).to have_content 'Json version'
        expect(page).to have_content 'Json project source'
      end
    end

    scenario 'with empty input fields for "Title", "Project manager", "Project manager email", "Repository", "Host name", "Deployment state", "Delete checkbox for hosts", "Ruby version", "Ruby project source", "Rails version", "Rails project source", "Json version", "Json project source"' do
      within 'form' do
        expect(page).to have_field 'project[title]', :value => ''
        expect(page).to have_field 'project[project_manager]', :value => ''
        expect(page).to have_field 'project[project_manager_email]', :value => ''
        expect(page).to have_field 'project[repository]', :value => ''
        expect(page).to have_field 'project[hosts_attributes][0][host_name]', :value => ''
        expect(page).to have_field 'project[hosts_attributes][0][deployment_state]', :value => ''
        expect(page).to have_field 'project[ruby_version]', :value => ''
        expect(page).to have_field 'project[ruby_project_source]', :value => ''
        expect(page).to have_field 'project[rails_version]', :value => ''
        expect(page).to have_field 'project[rails_project_source]', :value => ''
        expect(page).to have_field 'project[json_version]', :value => ''
        expect(page).to have_field 'project[json_project_source]', :value => ''
      end
    end

    scenario 'with input fields for "Title", "Project manager", "Project manager email", "Repository", "Host name", "Deployment state", "Delete checkbox for hosts", "Ruby version", "Ruby project source", "Rails version", "Rails project source", "Json version", "Json project source"' do
      within 'form' do
        expect(page).to have_field 'project[title]'
        expect(page).to have_field 'project[project_manager]'
        expect(page).to have_field 'project[project_manager_email]'
        expect(page).to have_field 'project[repository]'
        expect(page).to have_field 'project[hosts_attributes][0][host_name]'
        expect(page).to have_field 'project[hosts_attributes][0][deployment_state]'
        expect(page).to have_field 'project[ruby_version]'
        expect(page).to have_field 'project[ruby_project_source]'
        expect(page).to have_field 'project[rails_version]'
        expect(page).to have_field 'project[rails_project_source]'
        expect(page).to have_field 'project[json_version]'
        expect(page).to have_field 'project[json_project_source]'
      end
    end

    scenario 'with a * by required fields' do
      within 'form' do
        expect(page).to have_content '*'
      end
    end

    scenario 'with a hint by required fields' do
      within 'form' do
        expect(page).to have_content "Can't be blank"
        expect(page).to have_content 'Needs to blank or valid email address'
        expect(page).to have_selector '.help-block', :count => 3
      end
    end

    scenario 'with create button to be styled as button' do
      expect(page).to have_button 'Create Project' do |button|
        expect(button).to have_selector '.btn'
      end
    end

    scenario 'with a create button to create project' do
      expect(page).to have_button 'Create Project'

      page.fill_in 'project[title]', :with => 'vear'
      page.fill_in 'project[project_manager_email]', :with => 'andi@example.com'
      page.fill_in 'project[repository]', :with => 'github.com'

      click_button 'Create Project'
      current_path.should === '/projects'

      expect(page).to have_selector '.alert'
      expect(page).to have_selector '.alert-info'
      expect(page).to have_content 'Project was successfully created.'
      expect(page).to have_content 'vear'
      expect(page).to have_content 'andi@example.com'
      expect(page).to have_content 'github.com'
    end

    scenario 'with list link to be styled as button' do
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
