class UsersController < ApplicationController
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
  
  def edit
  end

  def show
  end
end
