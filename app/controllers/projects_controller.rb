class ProjectsController < InheritedResources::Base
 def new
    @project = Project.new
    @project.hosts.build
  end

  def edit
    @project = Project.find(params[:id])
    @project.hosts.build
  end

  def create
    @project = Project.new(params[:project])
    create! do |success, failure|
      success.html do
        @project.hosts.build if @project.hosts.blank?
        render :action => 'show'
      end

      failure.html do
        @project.hosts.build if @project.hosts.blank?
        render :action => 'new'
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    update! { @project }
  end

  def index
    index!
  end

  def dashboard
    good = Project.select { |project| project.overall_state === 'good' }
    warning = Project.select { |project| project.overall_state === 'warning' }
    bad = Project.select { |project| project.overall_state === 'bad' }
    @projects = [bad, warning, good].flatten
    index!
  end
end
