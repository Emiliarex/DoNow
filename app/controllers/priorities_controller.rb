class PrioritiesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @todo = Todo.find(params[:todo_id])
    @priority = Priority.new
  end
  
  def create
    @category = Category.find(params[:category_id])
    @todo = Todo.find(params[:todo_id])
    @priority = Priority.new
    if @priority.save
      flash[:notice] = "Priority has been set!"
      redirect_to categories_path
    else
      flash[:error] = "Something went wrong! Priority couldn't be saved. Try again!"
      redirect_to :back
    end
  end
end
