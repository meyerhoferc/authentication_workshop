class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    if User.authenticate(authenticate_params[:email], authenticate_params[:password])
      flash[:success] = "Log-in Successful!"
      session[:user_id] = User.find_by(email: params[:session][:email]).id
      redirect_to user_path(User.find(session[:user_id]))
    else
      flash[:error] = "Invalid credentials. Log in again!"
      redirect_to login_path
    end
  end

  private

  def authenticate_params
    params.require(:session).permit(:email, :password)
  end
end
