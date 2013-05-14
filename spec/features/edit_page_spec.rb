require 'spec_helper'

feature 'As a logged in user' do
  include CustomSpecHelpers

  context 'I see a edit page' do
    before :all do
      prepare_before_all_tests
    end

    before :each do
      sign_in

      click_link 'Detail'
      click_link 'Edit'
    end

    scenario 'with a field contains a title' do
      expect(page).to have_field 'project[title]'
    end

    scenario 'with a field contains a project manager' do
      expect(page).to have_field 'project[project_manager]'
    end

    scenario 'with a field contains a project manager email' do
      expect(page).to have_field 'project[project_manager_email]'
    end

    scenario 'with a field contains a repository path' do
      expect(page).to have_field 'project[repository]'
    end

    scenario 'with a field contains a host' do
      expect(page).to have_field 'project[hosts_attributes][0][host_name]'
    end

    scenario 'with a field contains a deployment state' do
      expect(page).to have_field 'project[hosts_attributes][0][deployment_state]'
    end

    scenario 'with a field contains a checkbox to delet a host' do
      expect(page).to have_field 'project[hosts_attributes][0][_destroy]'
    end

    scenario 'with a field contains the ruby version' do
      expect(page).to have_field 'project[ruby_version]'
    end

    scenario 'with a field contains the ruby project source' do
      expect(page).to have_field 'project[ruby_project_source]'
    end

    scenario 'with a field contains a rails version' do
      expect(page).to have_field 'project[rails_version]'
    end

    scenario 'with a field contains the rails project source' do
      expect(page).to have_field 'project[rails_project_source]'
    end

    scenario 'with a field contains a json version' do
      expect(page).to have_field 'project[json_version]'
    end

    scenario 'with a field contains the json project source' do
      expect(page).to have_field 'project[json_project_source]'
    end

    scenario 'with a button to update the project' do
      expect(page).to have_button 'Update Project'
    end

    scenario 'with a link to show the project' do
      expect(page).to have_link 'Show'
    end

    scenario 'with a link to list the project' do
      expect(page).to have_link 'List'
    end

    scenario 'with show to be styled as button' do
      expect(page).to have_link 'Show' do |link|
        expect(link).to have_selector '.btn'
      end
    end

    scenario 'with list to be styled as button' do
      expect(page).to have_link 'List' do |link|
        expect(link).to have_selector '.btn'
      end
    end
  end
end
