class Admin::UsersController < ApplicationController

  before_filter :restrict_admin_access

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "Created user #{@user.firstname}"
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end
  
  def destroy
    if @user.destroy
      flash.notice = "Deleted User #{@user.full_name}"
    else
      flash.notice = "Cannot delete user #{@user.full_name}"
    end
    redirect_to admin_users_path
  end 

  protected

  def set_user
    @user = User.find(params[:id])
  end  

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

  def is_admin?
    current_user && current_user.id == 1
  end

  def restrict_admin_access
    unless is_admin?
      flash.notice = "This function is restricted to admin."
      redirect_to root_path
    end
  end
end
