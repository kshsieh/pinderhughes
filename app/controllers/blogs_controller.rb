class BlogsController < ApplicationController
  load_and_authorize_resource  
  def index
    # @blogs = Blog.all
  end

  def new
    # @blog = Blog.new
  end

  def create
    # @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: 'blog created'
    else
      render 'new', alert: 'blog not created, try again.'
    end
  end
  
  def edit
    # @blog = Blog.find(params[:id])
  end
  
  def update
    # @blog = Blog.find(params[:id])
    if @blog.update_attributes(blog_params)
      redirect_to blogs_path, notice: 'update saved'
    else
      render 'edit', alert: 'update not saved'
    end
  end
  
  def destroy
    Blog.find(params[:id]).destroy
    redirect_to blogs_path, notice: 'blog post deleted'
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :entry, :user_id)
    end
end