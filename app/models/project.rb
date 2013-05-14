class Project < ActiveRecord::Base
  attr_accessible :id, :json_project_source, :json_version, :project_manager, :project_manager_email, :rails_project_source, :rails_version, :repository, :ruby_project_source, :ruby_version, :title, :hosts_attributes

  has_many :hosts
  accepts_nested_attributes_for :hosts, :allow_destroy => true, :reject_if => :all_blank

end
