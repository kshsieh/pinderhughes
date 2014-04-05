class UsersController < PagesController
  def show
    @user = User.where(primary: true).first
  end
end