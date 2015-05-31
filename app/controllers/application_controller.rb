class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate


  def authenticate
    @current_user = User.find session[:user] if session[:user]
  end


  
end
