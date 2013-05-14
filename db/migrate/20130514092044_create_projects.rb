class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :project_manager
      t.string :project_manager_email
      t.string :repository
      t.string :ruby_version
      t.string :ruby_project_source
      t.string :rails_version
      t.string :rails_project_source
      t.string :json_version
      t.string :json_project_source

      t.timestamps
    end
  end
end
