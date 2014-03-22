class BlogsController < ApplicationController
  before_filter :load_blog, only: :new
  
  def index
    @blogs = Blog.all
  end

  def new
  end

  private

  def load_blog
    @blog = Blog.find params[:id]
  end
end