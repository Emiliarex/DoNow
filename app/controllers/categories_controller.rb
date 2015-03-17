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
  
  def update
     @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to category_path(@category)
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
    end
  end

  def edit
    @category = Category.find(params[:id]) 
  end

  def show
    @category = Category.find(params[:id])
    @todos = @category.todos.order("deadline ASC")
  end

  def destroy
     @category = Category.find(params[:id])
    
    title = @category.title
    if @category.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to categories_path(@category)
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end 
  end
private

def category_params
  params.require(:category).permit(:title)
end
  
end
