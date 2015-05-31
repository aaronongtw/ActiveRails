class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user] = user.id
      redirect_to root_path
      ## session[:start] = Time.now ##for session timeout
    else
      flash[:notice] = "Invalid login, please try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_path
  end

end
