class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
      if @user.save
        redirect_to root_path
      else
        render :new
      end
  end

  def edit
    @user = @current_user
    render :new
  end

  def update
    user = @current_user
    user.update user_params
    redirect_to root_path
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end



end
