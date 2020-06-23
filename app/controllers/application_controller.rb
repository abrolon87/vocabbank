class ApplicationController < ActionController::Base
# gives access  to methods in/from views
# include ApplicationHelper (if you want to write these in there)
  helper_method :current_user 
  helper_method :logged_in?
  helper_method :find_vocab
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end
  
  def find_vocab
    @vocab = Vocab.find(params[:id])
  end
  
end
