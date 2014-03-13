require 'spec_helper'

describe VideosController do
  login_user
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

  context 'get#new' do
    it 'assigns a new video to @video' do
      get :new
      expect(assigns[:video]).to be_kind_of(Video)
    end

    it 'renders index template' do
      get :new
      expect(response).to render_template :new
    end
  end

  context 'post#create' do

    context 'given valid data' do
      before :each do
        video_attrs = FactoryGirl.attributes_for(:video)
        post :create, video: video_attrs
      end
      
      it 'save the new video in the db' do
        expect(Video.last.link).to eq(video[:link])
      end

      it 'redirects to video page' do
        expect(response).to redirect_to videos_path
      end
    end

    context 'given invalid data' do
      before :each do
        @video_attrs = FactoryGirl.attributes_for(:invalid_video)
      end

      it 'does not save the new video in the db' do
        expect { 
          post :create, video: @video_attrs 
        }.to_not change(Video, :count)
      end

      it 're-render the new template' do
        post :create, video: @video_attrs 
        expect(response).to render_template :new
      end
    end
  end

  context 'get#edit' do
    before :each do
      get :edit, id: video.id
    end

    it 'finds the requested video' do
      expect(assigns[:video]).to eq(video)
    end

    it 'renders edit template' do 
      expect(response).to render_template :edit
    end
  end

  context 'patch#update' do
    context 'given valid attributes' do 
      before :all do
        @new_attrs = FactoryGirl.attributes_for(:video, title: 'updated title', link: 'www.updatedlink.com')
      end
      it 'finds the requested video' do
        patch :update, id: video.id, video: FactoryGirl.attributes_for(:video)
        expect(assigns[:video]).to eq(video) 
      end
      it "changes the video's attributes" do
        patch :update, id: video.id, video: @new_attrs
        video.reload
        expect(video.title).to eq(@new_attrs[:title]) 
        expect(video.link).to eq(@new_attrs[:link]) 
      end
      it "redirects to the video index page" do
        patch :update, id: video.id, video: @new_attrs
        video.reload
        expect(response).to redirect_to videos_path
      end
    end

    context 'give invalid attributes' do
      before :each do
        @valid_video_attrs = FactoryGirl.attributes_for(:video)
        @invalid_video_attrs = FactoryGirl.attributes_for(:invalid_video)
        patch :update, id: video.id, video: @invalid_video_attrs
        video.reload
      end

      it "does not change the video's attributes" do
        expect(video.title).to eq(@valid_video_attrs[:title])
        expect(video.link).to eq(@valid_video_attrs[:link])
      end

      it "renders edit template" do
        expect(response).to render_template :edit
      end
    end
  end

  context 'delete#destroy' do
    it 'deletes the social media video' do 
      video
      expect{
        delete :destroy, id: video.id
      }.to change(Video, :count).by(-1)
    end 
    it "redirects to home page" do 
      video
      delete :destroy, id: video.id
      expect(response).to redirect_to videos_path
    end
  end
end