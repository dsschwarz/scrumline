class ProjectsController < ApplicationController
  def new
    @user = current_user
    @project = Project.new
  end
  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id
    
    if @project.save
      redirect_to "/projects"
    else
      render 'new'
    end
  end
  def index
    @projects = current_user.projects
  end
  def show
    @project = Project.find(params[:id])
  end
  def destroy
    @project = Project.find(params[:id])
    @project.tasks.each do |t|
      t.destroy
    end
    @project.destroy
    redirect_to "/projects"
  end
  def join
    @project = Project.find(params[:id])
    @project.users << current_user
  end
end
