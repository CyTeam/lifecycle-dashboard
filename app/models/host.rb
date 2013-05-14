class Host < ActiveRecord::Base
  attr_accessible :deployment_state, :host_name, :project_id

  belongs_to :project
end
