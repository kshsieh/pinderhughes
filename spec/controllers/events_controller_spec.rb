require 'spec_helper'

describe EventsController do 
  let(:event){ FactoryGirl.create(:event)}

  context 'get#index' do
    before(:each) do
      get :index
    end

    it 'populates an array of events' do
      expect(assigns[:events]).to eq([event])
    end

    it 'renders index template' do
      expect(response).to render_template :index
    end
  end

  context 'get#show' do
    before(:each) do
      get :show, id: event.id
    end

    it 'finds the requested event' do
      expect(assigns[:event]).to eq(event)
    end

    it 'renders show template' do
      expect(response).to render_template :show
    end
  end
end