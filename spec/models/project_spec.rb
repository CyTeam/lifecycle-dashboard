require 'spec_helper'

describe Project do
  context 'Validate fields with invalid data' do
    it 'should not have an empty title' do
      should_not have_valid(:title).when('')
    end

    it 'should not have an invalid email adress' do
      should_not have_valid(:project_manager_email).when('andi.com', 'andi@example', 'blabla')
    end

    it 'should not have an empty git repository' do
      should_not have_valid(:repository).when('')
    end
  end

  context 'Validate fields with valid data' do
    it 'should have a title' do
      should have_valid(:title).when('pernote')
    end

    it 'should have a project manager email address' do
      should have_valid(:project_manager_email).when('andi.staub@gemail.com')
    end

    it 'should have no email address' do
      should have_valid(:project_manager_email).when('  ')
    end

    it 'should have a git repository' do
      should have_valid(:repository).when('github.com')
    end
  end
end
