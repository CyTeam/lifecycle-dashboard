module CustomSpecHelpers
  def create_user
    User.create!(:email => 'andi@example.com',
                 :password => 'test4dev',
                 :password => 'test4dev')
  end

  def delete_user
    u = User.first
    u.destroy
  end

  def create_project
    Project.create!(:id => 1,
                    :title => 'bookyt',
                    :project_manager => 'simon',
                    :project_manager_email => 'simon@example.com',
                    :repository => 'git@github.com:huerlisi/bookyt.git',
                    :ruby_version => '1.9.3p4',
                    :ruby_project_source => 'good',
                    :rails_version => '3.2.13',
                    :rails_project_source => 'good',
                    :json_version => '1.7.7',
                    :json_project_source => 'good')


    Host.create!(:project_id => 1,
                 :host_name => 'bookyt.ch',
                 :deployment_state => 'Newest, secure code')
  end
  
  def delete_project
    p = Project.first
    p.destroy
  end

  def prepare_before_all_tests
    delete_user if User.first.present?
    delete_project if Project.first.present?

    create_user
    create_project
  end

  def sign_in
    visit '/'

    page.fill_in 'user[email]', :with => 'andi@example.com'
    page.fill_in 'user[password]', :with => 'test4dev'
    page.click_button 'Sign in'
  end
end
