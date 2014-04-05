class BlogsController < PagesController
  before_filter :load_blog, only: :show

  def index
    @blogs = Blog.all
  end

  def show
  end

  private

  def load_blog
    @blog = Blog.find params[:id]
  end
end