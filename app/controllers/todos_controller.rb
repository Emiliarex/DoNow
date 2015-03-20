class TodosController < ApplicationController
  
  def new
    @category = Category.find(params[:category_id])
    @todo = Todo.new
    3.times do
      @steps = @todo.steps.build
    end
  end
  
  def create
    @category = Category.find(params[:category_id])
    @todo = Todo.new(todo_params)
    @todo.category = @category
    if @todo.save
      flash[:notice] = "To-do has been saved!"
      redirect_to category_path(@category)
    else
      flash[:error] = "Oh no! To-do couldn't be saved. Try again!"
      redirect_to :back
  end
end

  def edit
    @category = Category.find(params[:category_id])
    @todo = Todo.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:category_id])
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      redirect_to edit_category_todo_path(@category, @todo)
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
    end
  end
  

  def show
    @category = Category.find(params[:category_id])
    @todo = Todo.find(params[:id])
    @steps = @todo.steps.order("order_number ASC")
    @comments = Comment.all
  end

  def destroy
    @category = Category.find(params[:category_id])
    @todo = Todo.find(params[:id])
    title = @todo.title
    if @todo.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to category_path(@category)
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end 
    
  end
  
private

def todo_params
  params.require(:todo).permit(:title, :description, :category_id, :steps_attributes => [:name, :id])
end
  
end
