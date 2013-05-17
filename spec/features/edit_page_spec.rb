require 'spec_helper'

feature 'As a logged in user' do
  include CustomSpecHelpers

  context 'I see a edit page' do
    before :all do
      prepare_before_all_tests
    end

    before :each do
      sign_in

      Net::SSH.stub(:start).and_raise("Errno::ENOENT: No such file or directory - getaddrinfo")
      visit 'projects/1/edit'
    end

    scenario 'with labels for each input with "Title", "Project manager", "Project manager email", "Repository", "Host name", "Deployment state", "Delete checkbox for hosts", "Ruby version", "Ruby project source", "Rails version", "Rails project source", "Json version", "Json project source"' do
      within 'form' do
        expect(page).to have_content 'Title'
        expect(page).to have_content 'Project manager'
        expect(page).to have_content 'Project manager email'
        expect(page).to have_content 'Repository'
        expect(page).to have_content 'Host name'
        expect(page).to have_content 'Deployment state'
        expect(page).to have_content 'Remove'
        expect(page).to have_content 'Ruby version'
        expect(page).to have_content 'Ruby project source'
        expect(page).to have_content 'Rails version'
        expect(page).to have_content 'Rails project source'
        expect(page).to have_content 'Json version'
        expect(page).to have_content 'Json project source'
      end
    end

    scenario 'with input fields prefilles with values for "Title", "Project manager", "Project manager email", "Repository", "Host name", "Deployment state", "Delete checkbox for hosts", "Ruby version", "Ruby project source", "Rails version", "Rails project source", "Json version", "Json project source"' do
      within 'form' do
        expect(page).to have_field 'project[title]', :value => 'bookyt'
        expect(page).to have_field 'project[project_manager]', :value => 'simon'
        expect(page).to have_field 'project[project_manager_email]', :value => 'simon@example.com'
        expect(page).to have_field 'project[repository]', :value => 'git@github.com:huerlisi/bookyt.git'
        expect(page).to have_field 'project[hosts_attributes][0][host_name]', :value => 'bookyt.ch'
        expect(page).to have_field 'project[hosts_attributes][0][deployment_state]', :value => 'Newest, secure code'
        expect(page).to have_field 'project[hosts_attributes][0][host_name]', :value => ''
        expect(page).to have_field 'project[hosts_attributes][0][deployment_state]', :value => ''
        expect(page).to have_field 'project[hosts_attributes][0][_destroy]', :value => 1
        expect(page).to have_field 'project[ruby_version]', :value => '1.9.3p4'
        expect(page).to have_field 'project[ruby_project_source]', :value => 'good'
        expect(page).to have_field 'project[rails_version]', :value => '3.2.13'
        expect(page).to have_field 'project[rails_project_source]', :value => 'good'
        expect(page).to have_field 'project[json_version]', :value => '1.7.7'
        expect(page).to have_field 'project[json_project_source]', :value => 'good'
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
        expect(page).to have_field 'project[hosts_attributes][0][_destroy]'
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

    scenario 'with update button to be styled as button' do
      expect(page).to have_button 'Update Project' do |button|
        expect(button).to have_selector '.btn'
      end
    end

    scenario 'with a update button to see project details page' do
      within 'form' do
        expect(page).to have_button 'Update Project'
        click_button 'Update Project'
      end
      current_path.should === '/projects/1'
    end

    scenario 'with show link to be styled as button' do
      expect(page).to have_link 'Show' do |link|
        expect(link).to have_selector '.btn'
      end
    end

    scenario 'with a link to see project details page' do
      expect(page).to have_link 'Show'
      click_link 'Show'
      current_path.should === '/projects/1'
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
