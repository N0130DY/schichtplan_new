class SessionsController < ApplicationController

  def new
  end

  #login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to starta_path, notice: 'Logged in!'
    else
      render :new
    end
  end

  #logout
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end