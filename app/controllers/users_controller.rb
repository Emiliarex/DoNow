class UsersController < ApplicationController
  
  include UsersHelper
  
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if user.save
      flash[:notice] = "You Signed Up Successfully!"
      redirect_to new_user_path
    else
      flash[:error] = "Oh no! Something is invalid in the form! Please try again!"
      redirect_to new_user_path
     end
  end
  
  def edit
  end
  
  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User Information Updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid User Information"
      redirect_to edit_user_registration_path
    end
  end
  

  def show
  end
    
  
  private
  
  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
