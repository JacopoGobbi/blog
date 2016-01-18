class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.try(:password_digest) == params[:session][:password_digest]
      session[:user_id] = user.id
      redirect_to users_path
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
