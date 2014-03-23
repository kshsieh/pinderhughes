require 'spec_helper'

describe VideosController do
  let(:video){ FactoryGirl.create(:video)}

  context 'get#index' do
    it 'populates an array of videos' do
      get :index
      expect(assigns[:videos]).to eq([video])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  context 'get#show' do
    before(:each) do
      get :show, id: video.id
    end

    it 'finds the requested video' do
      expect(assigns[:video]).to eq(video)
    end

    it 'renders index template' do
      expect(response).to render_template :show
    end
  end
end