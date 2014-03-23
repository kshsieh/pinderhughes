class Admin::PagesController < Admin::BaseController
  before_filter :authorize

  def home
  end 
end