require 'spec_helper'

describe SocialMediaSitesController do 
  let(:social_media_site){ FactoryGirl.create(:social_media_site) }

  context 'get#index' do
    before(:each) do
      get :index
    end

    it 'populates an array of social_media_sites' do
      expect(assigns[:social_media_sites]).to eq([social_media_site])
    end

    it 'renders index template' do
      expect(response).to render_template :index
    end
  end

  context 'get#show' do
    before(:each) do
      get :show, id: social_media_site.id
    end

    it 'finds the requested social_media_site' do
      expect(assigns[:social_media_site]).to eq(social_media_site)
    end

    it 'renders show template' do
      expect(response).to render_template :show
    end
  end
end