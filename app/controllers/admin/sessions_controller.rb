class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to '/admin'
    else
      redirect_to '/admin/sign_in'
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
