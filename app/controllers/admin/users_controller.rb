class Admin::UsersController < Admin::BaseController

  before_filter :load_users, only: [:show, :edit, :update]
  before_filter :authorize

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to admin_path, notice: 'Profile updated.'
    else
      render 'edit', alert: 'update failed. try again'
    end
  end

  private 
    def load_users
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :biography, :email, :password,
        social_media_sites: [:site_name, :link, :id, :user_id, :_destroy])
    end
end
