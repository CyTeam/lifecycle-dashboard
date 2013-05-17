class Project < ActiveRecord::Base
  attr_accessible :id, :json_project_source, :json_version, :project_manager, :project_manager_email, :rails_project_source, :rails_version, :repository, :ruby_project_source, :ruby_version, :title, :hosts_attributes

  has_many :hosts
  accepts_nested_attributes_for :hosts, :allow_destroy => true, :reject_if => :all_blank

  validates :title, :repository, :presence => true
  validates :project_manager_email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :if => 'project_manager_email.present?'

  def overall_state
    state_array = [json_project_source, rails_project_source, ruby_project_source]

    hosts.each do |host|
      if host.deployment_state === 'Newest, secure code'
        state_array << 'good'
      elsif host.deployment_state === 'Insecure code'
        state_array << 'bad'
      else
        state_array << 'warning'
      end
    end

    if state_array.all? { |state| state === 'good' }
      'good'
    elsif state_array.any? { |state| state === 'bad' }
      'bad'
    else
      'warning'
    end
  end
end
