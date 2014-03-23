require 'spec_helper'

describe BlogsController do
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

  context 'get#show' do
    before(:each) do
      get :show, id: blog.id
    end

    it 'finds the requested blog' do
      expect(assigns[:blog]).to eq(blog)
    end

    it 'renders index template' do
      expect(response).to render_template :show
    end
  end
end