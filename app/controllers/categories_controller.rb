class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order("created_at ASC")
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "You just made a new category!"
      redirect_to categories_path
    else
      flash[:error] = "Uh-Oh! Your category could not be saved!"
      redirect_to :back
    end
  end

  def edit
    @category = Category.find(params[:id]) 
  end

  def show
    @category = Category.find(params[:id])
    @todos = @category.todos.order("deadline ASC")
  end

private

def category_params
  params.require(:category).permit(:title)
end
  
end
