class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase) unless params[:session][:email].nil?
    if user && user.authenticate(params[:session][:password])

    else
      flash[:danger] = 'Invalid email/password combination'
      render :new
    end
  end
  def new
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
