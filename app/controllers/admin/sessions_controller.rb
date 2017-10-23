class Admin::SessionsController < ApplicationController
  layout "admin"
  
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    
    if @user && @user.authenticate(params[:session][:password])
      sign_in

      redirect_to admin_path
    else
      render 'new'
    end
  end

  def sign_in
    session[:user_id] = @user.id
  end

  def destroy
    sign_out

    redirect_to admin_path
  end
end
