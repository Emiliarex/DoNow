class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order("created_at ASC")
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new (category-params)
    if @category.save
      flash[:notice] = "You just made a new category!"
      redirect_to categories_path
    else
      flash[:error] = "Uh-Oh! Your category could not be saved!"
      redirect_to :back
  end

  def edit
    @category = Category.find (params [:id]) 
  end

  def show
    @categories = Category.find (params [:id])
    @todos = @categories.todos.order("deadline ASC")
  end
end
