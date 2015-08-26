class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def index
    @projects = current_user.projects
  end

  def create
    @project = Project.create(project_params)
    @project.user = current_user

    respond_to do |format|
      if @project.save
        format.js {}
      else
        format.js { render :new }
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  private

  def project_params
    params.require(:project).permit(:title, :user_id)
  end
end
