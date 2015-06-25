class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  def impersonate
    user = User.find_by(id: params[:user_id])
    if user
      set_admin_user_id current_user.id
      set_current_user_id params[:user_id]
      redirect_to movies_path, notice: "You are now impersonating #{user.firstname}!"
    else
      redirect_to admin_users_path
    end
  end

  def destroy
    if admin_user?
      session[:user_id] = admin_user.id
      binding.pry
      admin_user = nil
      binding.pry
      redirect_to admin_users_path, notice: "You are no longer impersonating someone."
    else
      session[:user_id] = nil 
      redirect_to movies_path, notice: "Adios!"
    end
  end

  def stored_admin
    @stored_admin
  end

end