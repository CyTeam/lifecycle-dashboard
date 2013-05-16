module ProjectsHelper
  def project_source_state(project)
    state_array = [project.ruby_project_source, project.rails_project_source, project.json_project_source]

    if state_array.all? { |state| state === 'good' }
      'good'
    elsif state_array.any? { |state| state === 'grave' }
      'bad'
    else
      'warning'
    end
  end

  def overall_deployment_state(project)
    overall_deployment_state_array = []

    project.hosts.each do |host|
      overall_deployment_state_array << host.deployment_state unless nil?
    end

    if overall_deployment_state_array.all? { |state| state === 'Newest, secure code' }
      'good'
    elsif overall_deployment_state_array.any? { |state| state === 'Insecure code' }
      'bad'
    else
      'warning'
    end
  end

  def project_overall_state(project)
    overall_state_array = [project_source_state(project), overall_deployment_state(project)]

    if overall_state_array.all? { |state| state === 'good' }
      'good'
    elsif overall_state_array.any? { |state| state === 'bad' }
      'bad'
    else
      'warning'
    end
  end

  def wrap_in_label(state)
    if state === 'good' || state === 'Newest, secure code'
      "<span class='label label-success'>#{state}</span>".html_safe
    elsif state === 'bad' || state === 'Insecure code'
      "<span class='label label-important'>#{state}</span>".html_safe
    else
      "<span class='label label-warning'>#{state}</span>".html_safe
    end
  end
end
