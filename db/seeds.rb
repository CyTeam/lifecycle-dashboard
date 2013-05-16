User.create!(:email => 'andi@example.com',
             :password => 'test4dev',
             :password => 'test4dev')

Project.create!(:id => 1,
                :title => 'Bookyt',
                :project_manager => 'Simon Huerlimann',
                :project_manager_email => 'huerlisi@cyt.ch',
                :repository => 'git@github.com:huerlisi/bookyt.git',
                :ruby_version => '1.9.3',
                :ruby_project_source => 'good',
                :rails_version => '3.2.13',
                :rails_project_source => 'good',
                :json_version => '1.7.7',
                :json_project_source => 'good')

Host.create!(:project_id => 1,
             :host_name => 'bookyt.cyt.ch',
             :deployment_state => 'Newest, secure code')

Host.create!(:project_id => 1,
             :host_name => 'demo.bookyt.ch',
             :deployment_state => 'Newest, secure code')

Project.create!(:id => 2,
                :title => 'Vear',
                :project_manager => 'Andi Staub',
                :project_manager_email => 'andi.staub@cyt.ch',
                :repository => 'git@github.com:kitsane/vear.git',
                :ruby_version => '1.9.3',
                :ruby_project_source => 'good',
                :rails_version => '3.2.12',
                :rails_project_source => 'warning',
                :json_version => '1.7.7',
                :json_project_source => 'good')

Host.create!(:project_id => 2,
             :host_name => 'vear.cyt.ch',
             :deployment_state => 'Old, secure code')
