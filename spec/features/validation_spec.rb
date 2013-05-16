require 'spec_helper'

feature 'Edit form validations' do
  include CustomSpecHelpers

  before :all do
    prepare_before_all_tests
  end

  before :each do
    sign_in

    visit 'projects/1/edit'
  end

  context 'with invalid data I see' do

    scenario 'red marked input fields' do
      within 'form' do
        page.fill_in 'project[title]', :with => ''
        page.fill_in 'project[project_manager_email]', :with => 'andi.com'
        page.fill_in 'project[repository]', :with => ''

        page.click_button 'Update Project'
      end

      expect(page).to have_selector '.error'
    end

    scenario 'an red alert' do
      page.fill_in 'project[title]', :with => ''
      page.fill_in 'project[project_manager_email]', :with => 'andi.com'
      page.fill_in 'project[repository]', :with => ''

      page.click_button 'Update Project'

      expect(page).to have_selector '.alert'
      expect(page).to have_selector '.alert-error'
      expect(page).to have_content 'Please review the problems below:'
    end

    scenario 'input fields with entered values' do
      within 'form' do
        page.fill_in 'project[title]', :with => ''
        page.fill_in 'project[project_manager_email]', :with => 'andi.com'
        page.fill_in 'project[repository]', :with => ''

        page.click_button 'Update Project'
      end

      within 'form' do
        expect(page).to have_field 'project[project_manager]', :value => 'simon'
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
  end

  context 'with valid data I see' do

    scenario 'the detail page with a notice' do
      page.click_button 'Update Project'

      current_path.should === '/projects/1'

      expect(page).to have_selector '.alert'
      expect(page).to have_selector '.alert-info'
      expect(page).to have_content 'Project was successfully updated.'
    end

    scenario 'the detail page with entered attributes' do
      page.click_button 'Update Project'

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
  end
end
