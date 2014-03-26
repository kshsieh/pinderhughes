require 'spec_helper'

describe Admin::EventsController do
  login_user
  let(:event){ FactoryGirl.create(:event)}

  context 'get#index' do
    it 'populates an array of events' do
      get :index
      expect(assigns[:events]).to eq([event])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  context 'get#new' do
    it 'assigns a new event to @event' do
      get :new
      expect(assigns[:event]).to be_kind_of(Event)
    end

    it 'renders index template' do
      get :new
      expect(response).to render_template :new
    end
  end

  context 'post#create' do

    context 'given valid data' do
      before :each do
        event_attrs = FactoryGirl.attributes_for(:event)
        post :create, event: event_attrs
      end
      
      it 'save the new event in the db' do
        expect(Event.last.link).to eq(event[:link])
      end

      it 'renders index template' do
        expect(response).to redirect_to admin_events_path
      end
    end

    context 'given invalid data' do
      before :each do
        @event_attrs = FactoryGirl.attributes_for(:invalid_event)
      end

      it 'does not save the new event in the db' do
        expect { 
          post :create, event: @event_attrs 
        }.to_not change(Event, :count)
      end

      it 're-render the new template' do
        post :create, event: @event_attrs 
        expect(response).to render_template :new
      end
    end
  end

  context 'get#edit' do
    before :each do
      get :edit, id: event.id
    end

    it 'finds the requested event' do
      expect(assigns[:event]).to eq(event)
    end

    it 'renders edit template' do 
      expect(response).to render_template :edit
    end
  end

  context 'patch#update' do
    context 'given valid attributes' do 
      before :all do
        @new_attrs = FactoryGirl.attributes_for(:event, name: 'updated name', link: 'www.updatedlink.com')
      end
      it 'finds the requested event' do
        patch :update, id: event.id, event: FactoryGirl.attributes_for(:event)
        expect(assigns[:event]).to eq(event) 
      end
      it "changes the event's attributes" do
        patch :update, id: event.id, event: @new_attrs
        event.reload
        expect(event.venue).to eq(@new_attrs[:venue]) 
        expect(event.link).to eq(@new_attrs[:link]) 
      end
      it "redirects to the event index page" do
        patch :update, id: event.id, event: @new_attrs
        event.reload
        expect(response).to redirect_to admin_events_path
      end
    end

    context 'give invalid attributes' do
      before :each do
        @valid_event_attrs = FactoryGirl.attributes_for(:event)
        @invalid_event_attrs = FactoryGirl.attributes_for(:invalid_event)
        patch :update, id: event.id, event: @invalid_event_attrs
        event.reload
      end

      it "does not change the event's attributes" do
        expect(event.link).to eq(@valid_event_attrs[:link])
        expect(event.venue).to eq(@valid_event_attrs[:venue])
      end

      it "renders edit template" do
        expect(response).to render_template :edit
      end
    end
  end

  context 'delete#destroy' do
    it 'deletes the social media event' do 
      event
      expect{
        delete :destroy, id: event.id
      }.to change(Event, :count).by(-1)
    end 
    it "redirects to home page" do 
      event
      delete :destroy, id: event.id
      expect(response).to redirect_to admin_events_path
    end
  end
end