class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.integer :project_id
      t.string :host_name
      t.string :deployment_state

      t.timestamps
    end
  end
end
