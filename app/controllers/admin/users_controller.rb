class Admin::UsersController < ApplicationController
  before_action :ensure_superuser
  before_action :set_user, except: :index

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if params[:role] == "user" && @user.has_role?(:admin)
      @user.remove_role :admin
    elsif params[:role] == "admin" && !(@user.has_role?(:admin))
      @user.add_role :admin
    end
    redirect_to admin_users_url
  end

  def destroy
    if @user.has_role? :superuser
      redirect_to admin_users_url, flash: { popup_alert: 'A Superuser cannot be destroyed' }
    else
      username = @user.username
      @user.destroy
      redirect_to admin_users_url, flash: { popup_alert: "User #{username} was successfully destroyed." }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  rescue
    not_found
  end
end
