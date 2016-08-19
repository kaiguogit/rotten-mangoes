class UsersController < ApplicationController
  
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    else
      render :new
    end
  end
  
  def show
    
  end

  protected

  def set_user
    @user = User.find(params[:id])
  end

   def user_params
     params.require(:user).permit(:email, :firstname, :lastname, :admin, :password, :password_confirmation)
   end
end
