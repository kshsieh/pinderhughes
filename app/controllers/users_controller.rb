class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'Profile updated.'
    else
      render 'edit', alert: 'update failed. try again'
    end
  end

  private 
    def user_params
      params.require(:user).permit(
        :first_name, :last_name, :biography, :email, :password,
        social_media_sites: [:site_name, :link, :id, :user_id, :_destroy])
    end
end
