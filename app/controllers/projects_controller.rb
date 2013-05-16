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
end
