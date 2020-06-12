class UsersController < ApplicationController

  def index 
    @users = User.all
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
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id]) # nil if doesnt find anything ...find gives an error
    redirect_to '/' if !@user
  end 

  private 

  def user_params 
    params.require(:user).permit(:name, :email, :username, :password)
  end

end
