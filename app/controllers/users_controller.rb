class UsersController < ApplicationController

  def index 
    redirect_to '/signup'
  end 

  def new 
    @user = User.new
  end 

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else  
      render :new
    end
  end

  def show 
    @user = User.find_by_id(params[:id]) 
    redirect_to '/' if !@user
  end 

  private 

  def user_params 
    params.require(:user).permit(:name, :email, :username, :password)
  end

end
