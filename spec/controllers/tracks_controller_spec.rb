require 'spec_helper'
require 'debugger'

describe TracksController do
  login_user #defined in spec/support.rb
  let(:track){FactoryGirl.create(:track)}

  context 'get#index' do
    it 'populates an array of tracks' do
      get :index
      expect(assigns[:tracks]).to eq([track])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  context 'get#new' do
    it 'assigns a new Track to @track' do
      get :new
      expect(assigns[:track]).to be_kind_of(Track)
    end

    it 'renders index template' do
      get :new
      expect(response).to render_template :new
    end
  end

  context 'post#create' do

    context 'given valid data' do
      before :each do
        track_attrs = FactoryGirl.attributes_for(:track)
        post :create, track: track_attrs
      end
      
      it 'save the new track in the db' do
        expect(Track.last.link).to eq(track[:link])
      end

      it 'renders index template' do
        expect(response).to redirect_to root_path
      end
    end

    context 'given invalid data' do
      before :each do
        @track_attrs = FactoryGirl.attributes_for(:invalid_track)
      end

      it 'does not save the new track in the db' do
        expect { 
          post :create, track: @track_attrs 
        }.to_not change(Track, :count)
      end

      it 're-render the new template' do
        post :create, track: @track_attrs 
        expect(response).to render_template :new
      end
    end
  end

  context 'get#edit' do
    before :each do
      get :edit, id: track.id
    end

    it 'finds the requested track' do
      expect(assigns[:track]).to eq(track)
    end

    it 'renders edit template' do 
      expect(response).to render_template :edit
    end
  end

  context 'patch#update' do
    context 'given valid attributes' do 
      before :all do
        @new_attrs = FactoryGirl.attributes_for(:track, name: 'updated name', link: 'www.updatedlink.com')
      end
      it 'finds the requested track' do
        patch :update, id: track.id, track: FactoryGirl.attributes_for(:track)
        expect(assigns[:track]).to eq(track) 
      end
      it "changes the track's attributes" do
        patch :update, id: track.id, track: @new_attrs
        track.reload
        expect(track.name).to eq(@new_attrs[:name]) 
        expect(track.link).to eq(@new_attrs[:link]) 
      end
      it "redirects to the track index page" do
        patch :update, id: track.id, track: @new_attrs
        track.reload
        expect(response).to redirect_to tracks_path
      end
    end

    context 'give invalid attributes' do
      before :each do
        @track_attrs = FactoryGirl.attributes_for(:invalid_track)
        patch :update, id: track.id, track: @track_attrs
        track.reload
      end

      it "does not change the track's attributes" do
        expect(track.link).to eq("https://soundcloud.com/holyghostnyc/blood-orange-youre-not-good-enough-holy-ghost-bootleg")
        expect(track.name).to eq("Blood Orange - You're Not Good Enough (Holy Ghost! bootleg)")
      end

      it "renders edit template" do
        expect(response).to render_template :edit
      end
    end
  end

  context 'delete#destroy' do

    it 'deletes the social media track' do 
      track
      expect{
        delete :destroy, id: track.id
      }.to change(Track, :count).by(-1)
    end 
    it "redirects to home page" do 
      track
      delete :destroy, id: track.id
      expect(response).to redirect_to root_path
    end
  end
end