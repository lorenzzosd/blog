class Admin::UsersController < ApplicationController
  layout "admin"

  before_filter :valid_user, :except => [:new]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to [:admin, @user]
      
      sign_in
    else 
      render action: :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user ||= User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)

    if user_params[:password].blank?
      user_params = user_params.except(:password, :password_confirmation) 
    end

    @user.update_attributes(user_params.except(:email))

    redirect_to [:admin, @user]
  end

  def destroy
    User.find(params[:id]).destroy

    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def valid_user
    redirect_to admin_sign_in_path unless logged_in?
  end
end
