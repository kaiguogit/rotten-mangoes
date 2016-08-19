class Admin::UsersController < ApplicationController

  before_filter :restrict_admin_access

  def get
  end

  protected

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
