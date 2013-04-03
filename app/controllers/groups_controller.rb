class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def show
    @group = Group.find(params[:id])
  end
  def create
    @group = Group.new params[:group]
    if @group.save
      @group.users << current_user
      redirect_to "/groups"
    else
      render 'new'
    end
  end
  def index
    @groups = Group.all
  end
end
