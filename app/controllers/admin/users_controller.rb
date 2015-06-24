class Admin::UsersController < ApplicationController

  before_filter :restrict_admin

  def show
    @user = User.find(params[:id])
  end

  def index 
    @users = User.all.order("firstname").page(params[:page]).per(3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "User #{@user.firstname} has been created."
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "User #{@user.id} has been destroyed!"
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

end
