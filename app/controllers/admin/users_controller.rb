class Admin::UsersController < ApplicationController
  before_action :set_user, except: :index
  before_action :ensure_superuser

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if params[:role] == "user" && @user.has_role?(:admin)
      @user.remove_role :admin
    elsif params[:role] == "admin" && !(@user.has_role?(:admin))
      @user.add_role :admin
    end
    redirect_to admin_users_url
  end

  # DELETE /users/1
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
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  rescue
    not_found
  end
end
