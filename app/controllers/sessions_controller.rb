class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].to_s.downcase)
    if @user&.authenticate(params[:session][:password])
      log_in @user
      check_remember @user
      redirect_to @user
    else
      flash.now[:danger] = t "error_session"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def check_remember user
    if params[:session][:remember_me] == "1"
      remember user
    else
      forget user
    end
  end
end
