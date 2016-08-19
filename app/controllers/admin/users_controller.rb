class Admin::UsersController < UsersController

  before_filter :restrict_admin_access

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
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
    user_params
    if @user.update_attributes(user_params)
      flash.notice = "edited user #{@user.full_name}"
      redirect_to admin_users_path
    else
      flash.notice = "failed to user #{@user.full_name}"
      redirect_to edit_user_path(@user)
    end
  end
  
  def destroy
    if @user.destroy
      UserMailer.account_delete_email(@user).deliver_later
      flash.notice = "Deleted User #{@user.full_name}"
    else
      flash.notice = "Cannot delete user #{@user.full_name}"
    end
    redirect_to admin_users_path
  end 

  def enable_preview
    admin_id = session[:user_id]
    session[:user_id] = params[:id]
    session[:admin_id] = admin_id
    redirect_to movies_path
  end

  def disable_preview
    session[:user_id] = session[:admin_id]
    session[:admin_id] = nil
    redirect_to admin_users_path
  end

  protected


  def restrict_admin_access
    unless is_admin?
      flash.notice = "This function is restricted to admin."
      redirect_to root_path
    end
  end
end
