class SessionsController < ApplicationController

  before_action :require_no_user!, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user.nil?
      flash.now[:errors] = ["User not found"]
      render :new
    else
      login_user!
      redirect_to bands_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_user_url
  end

end
