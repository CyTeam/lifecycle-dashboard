module ProjectsHelper
  def put_project_source_state(ruby_project_source, rails_project_source, json_project_source)
    state_array = [ruby_project_source, rails_project_source, json_project_source]

    if state_array.all? { |state| state === 'good' }
      'good'
    elsif state_array.any? { |state| state === 'grave' }
      'bad'
    else
      'warning'
    end
  end
end
