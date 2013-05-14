require 'spec_helper'

feature 'As a logged in user' do
  include CustomSpecHelpers

  context 'I see a detail page' do
    before :all do
      prepare_before_all_tests
    end

    before :each do
      sign_in

      click_link 'Detail'
    end

    scenario 'with a heading for title' do
      expect(page).to have_content 'Title'
    end

    scenario 'with a heading for project manager' do
      expect(page).to have_content 'Project manager'
    end

    scenario 'with a heading for repository' do
      expect(page).to have_content 'Repository'
    end

    scenario 'with a heading for hosts' do
      expect(page).to have_content 'Hosts'
    end

    scenario 'with a heading for project source state' do
      expect(page).to have_content 'Project source state'
    end

    scenario 'with a heading for project overall state' do
      expect(page).to have_content 'Project overall state'
    end

    scenario 'with a field contains a title' do
      expect(page).to have_content 'bookyt'
    end

    scenario 'with a field contains a project manager' do
      expect(page).to have_content 'simon'
    end

    scenario 'within the project manager field is a link to email him' do
      expect(page).to have_link 'simon@example.com'
      expect(page).to have_xpath '//a[contains(@href, email)]'
    end

    scenario 'with a field contains a repository path' do
      expect(page).to have_content 'git@github.com:huerlisi/bookyt.git'
    end

    scenario 'with a field contains a host' do
      expect(page).to have_content 'bookyt.ch'
    end

       scenario 'with a link to edit the project' do
      expect(page).to have_link 'Edit'
    end

    scenario 'with a link to list the project' do
      expect(page).to have_link 'List'
    end

    scenario 'with edit link to be styled as button' do
      expect(page).to have_link 'Edit' do |link|
        expect(link).to have_selector '.btn'
      end
    end

    scenario 'with list link to be styled as button' do
      expect(page).to have_link 'List' do |link|
        expect(link).to have_selector '.btn'
      end
    end
  end
end
