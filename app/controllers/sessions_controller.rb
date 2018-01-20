class SessionsController < ApplicationController
  def new
  end

  def create
    holder = Holder.find_by(name: params[:name])

    if holder && holder.authenticate(params[:password])
      # login
      session[:holder_id] = holder.id
      flash[:notice] = "Welcome, you've logged in."
      redirect_to accounts_path
    else
      # error on login form
      flash[:error] = "There's something wrong with your username or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:holder_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end
end
