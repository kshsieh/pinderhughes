class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'Profile updated.'
    end
  end

  private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :biography)
    end
end
