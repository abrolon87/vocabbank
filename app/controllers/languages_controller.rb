class LanguagesController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def index
    @languages = Language.all
  end
  
end
