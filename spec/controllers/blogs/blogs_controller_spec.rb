require 'spec_helper'

describe BlogsController do
  login_user
  let(:blog){ FactoryGirl.create(:blog)}

  context 'get#index' do
    it 'populates an array of blogs' do
      get :index
      expect(assigns[:blogs]).to eq([blog])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  context 'get#new' do
    it 'assigns a new blog to @blog' do
      get :new
      expect(assigns[:blog]).to be_kind_of(Blog)
    end

    it 'renders index template' do
      get :new
      expect(response).to render_template :new
    end
  end

  context 'post#create' do

    context 'given valid data' do
      before :each do
        blog_attrs = FactoryGirl.attributes_for(:blog)
        post :create, blog: blog_attrs
      end
      
      it 'save the new blog in the db' do
        expect(Blog.last.title).to eq(blog[:title])
        expect(Blog.last.entry).to eq(blog[:entry])
      end

      it 'redirects to blog page' do
        expect(response).to redirect_to blogs_path
      end
    end

    context 'given invalid data' do
      before :each do
        @blog_attrs = FactoryGirl.attributes_for(:invalid_blog)
      end

      it 'does not save the new blog in the db' do
        expect { 
          post :create, blog: @blog_attrs 
        }.to_not change(Blog, :count)
      end

      it 're-render the new template' do
        post :create, blog: @blog_attrs 
        expect(response).to render_template :new
      end
    end
  end

  context 'get#edit' do
    before :each do
      get :edit, id: blog.id
    end

    it 'finds the requested blog' do
      expect(assigns[:blog]).to eq(blog)
    end

    it 'renders edit template' do 
      expect(response).to render_template :edit
    end
  end

  context 'patch#update' do
    context 'given valid attributes' do 
      before :all do
        @new_attrs = FactoryGirl.attributes_for(:blog, title: 'updated title', link: 'www.updatedlink.com')
      end
      it 'finds the requested blog' do
        patch :update, id: blog.id, blog: FactoryGirl.attributes_for(:blog)
        expect(assigns[:blog]).to eq(blog) 
      end
      it "changes the blog's attributes" do
        patch :update, id: blog.id, blog: @new_attrs
        blog.reload
        expect(blog.title).to eq(@new_attrs[:title]) 
        expect(blog.entry).to eq(@new_attrs[:entry]) 
      end
      it "redirects to the blog index page" do
        patch :update, id: blog.id, blog: @new_attrs
        blog.reload
        expect(response).to redirect_to blogs_path
      end
    end

    context 'give invalid attributes' do
      before :each do
        @valid_blog_attrs = FactoryGirl.attributes_for(:blog)
        @invalid_blog_attrs = FactoryGirl.attributes_for(:invalid_blog)
        patch :update, id: blog.id, blog: @invalid_blog_attrs
        blog.reload
      end

      it "does not change the blog's attributes" do
        expect(blog.title).to eq(@valid_blog_attrs[:title])
        expect(blog.entry).to eq(@valid_blog_attrs[:entry])
      end

      it "renders edit template" do
        expect(response).to render_template :edit
      end
    end
  end

  context 'delete#destroy' do
    it 'deletes the social media blog' do 
      blog
      expect{
        delete :destroy, id: blog.id
      }.to change(Blog, :count).by(-1)
    end 
    it "redirects to home page" do 
      blog
      delete :destroy, id: blog.id
      expect(response).to redirect_to blogs_path
    end
  end
end