class PagesController < ApplicationController
  helper_method :primary_user_email

  def home
  end

  private

  def primary_user_email
    User.where(primary: true).first.email  if User.where(primary: true).count > 0
  end
end