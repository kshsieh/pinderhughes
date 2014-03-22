require 'spec_helper'

describe TracksController do
  let(:track){FactoryGirl.create(:track)}

  context 'get#index' do
    before(:each) do
      get :index
    end

    it 'populates an array of tracks' do
      expect(assigns[:tracks]).to eq([track])
    end

    it 'renders index template' do
      expect(response).to render_template :index
    end
  end

  context 'get#show' do
    before(:each) do
      get :show, id: track.id
    end

    it 'finds the requested track' do
      expect(assigns[:track]).to eq(track)
    end

    it 'renders show template' do
      expect(response).to render_template :show
    end
  end
end