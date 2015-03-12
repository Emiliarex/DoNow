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

  def show
    @category = Category.find(params[:category_id])
    @todo = Todo.find(params[:id])
    @steps = @todo.steps.order("order_number ASC")
  end

private

def todo_params
  params.require(:todo).permit(:title, :description, :category_id, :steps_attributes => [:name, :id])
end
  
end
