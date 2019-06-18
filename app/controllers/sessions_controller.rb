class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].to_s.downcase)
    if @user&.authenticate(params[:session][:password])
      logging_in @user
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
    if params[:session][:remember_me] == Settings.remember_status.to_s
      remember user
    else
      forget user
    end
  end

  def logging_in _user
    if @user.activated?
      log_in @user
      check_remember @user
      redirect_back_or @user
    else
      flash[:warning] = t "check_email"
      redirect_to root_url
    end
  end
end
