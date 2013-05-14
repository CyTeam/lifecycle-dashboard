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
    create! { @project }
  end

  def update
    @project = Project.find(params[:id])
    update! { @project }
  end
end
