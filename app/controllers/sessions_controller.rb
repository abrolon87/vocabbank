class SessionsController < ApplicationController
  
  def home
  end
  
  def login 
  end

  def destroy 
    session.clear
    redirect_to root_path
  end
  
  def create 
    user = User.find_by(username: params[:user][:username])
    
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user) # '/users/#{user.id}'
    else  
      flash[:message] = "Invalid Login Info, Please Try Again"
      redirect_to '/login'
    end
  
  end

  def github_create
    @user = User.from_omniauth(auth)
    session[:user_id] = @user.id
    #flash[:success] = "Welcome, #{@user.username}!"
    redirect_to user_path(@user)
  end

  #   @user = User.find_or_create_by(email: auth["info"]["email"])
  #   binding.pry
  #   if !@user.password_digest #no password means no name
  #       @user.password_digest = SecureRandom.hex 
  #       @user.name = auth["info"]["name"]
    

  private 

  def auth
    request.env['omniauth.auth']
  end

end