require 'spec_helper'

describe Admin::SocialMediaSitesController do 
  login_user
  let(:social_media_site){ FactoryGirl.create(:social_media_site) }

  context 'get#index' do
    it 'populates an array of specs' do
      get :index
      expect(assigns[:social_media_sites]).to eq([social_media_site])
    end
    it 'renders index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  context 'get#new' do
    it 'assigns a new SocialMediaSite to @social_media_site' do
      get :new
      expect(assigns[:social_media_site]).to be_kind_of(SocialMediaSite)
    end
  end

  context 'post#create' do
    context 'given valid data' do
      it 'save the new site in the db' do
        social_media_site_attrs = FactoryGirl.attributes_for(:social_media_site)
        post :create, social_media_site: social_media_site_attrs
        expect(SocialMediaSite.last.link).to eq(social_media_site_attrs[:link])
      end
    end

    context 'given invalid data' do
      it 'does not save the new site in the db' do
        social_media_site_attrs = FactoryGirl.attributes_for(:invalid_social_media_site)
        expect {
          post :create, social_media_site: social_media_site_attrs
        }.to_not change(SocialMediaSite, :count)
      end

      it 're-render the new template' do
        social_media_site_attrs = FactoryGirl.attributes_for(:invalid_social_media_site)
        post :create, social_media_site: social_media_site_attrs
        expect(response).to render_template :new
      end
    end
  end

  context 'get#edit' do
    it 'finds the requested social_media_site' do
      get :edit, id: social_media_site.id 
      expect(assigns[:social_media_site]).to eq(social_media_site) 
    end

    it 'renders edit template' do 
      get :edit, id: social_media_site.id
      expect(response).to render_template('edit')
    end
  end

  context 'patch#update' do
    context 'given valid attributes' do 
      before :all do
        @new_attrs = FactoryGirl.attributes_for(:social_media_site, site_name:'new instagram', link:'www.new-instagram.com')
      end
      it 'finds the requested social_media_site' do
        patch :update, id: social_media_site.id, social_media_site: FactoryGirl.attributes_for(:social_media_site)
        expect(assigns[:social_media_site]).to eq(social_media_site) 
      end
      it "changes the social_media_site's attributes" do
        patch :update, id: social_media_site.id, social_media_site: @new_attrs
        social_media_site.reload
        expect(social_media_site.site_name).to eq(@new_attrs[:site_name])
        expect(social_media_site.link).to eq(@new_attrs[:link])
      end
      it "redirects to the social_media_site's page" do
        patch :update, id:social_media_site.id, social_media_site: @new_attrs
        social_media_site.reload
        expect(response).to redirect_to root_path
      end
    end

    context 'give invalid attributes' do
      it "does not change the social_media_site's attributes" do
        patch :update, id: social_media_site.id, social_media_site: FactoryGirl.attributes_for(:invalid_social_media_site)
        social_media_site.reload
        expect(social_media_site.site_name).to eq('Instagram')
        expect(social_media_site.link).to eq('www.instagram.com')
      end
      it "renders edit template" do
        patch :update, id: social_media_site.id, social_media_site: FactoryGirl.attributes_for(:invalid_social_media_site)
        social_media_site.reload
        expect(response).to render_template('edit')
      end
    end
  end

  context 'delete#destroy' do
    before :each do 
      social_media_site
    end 
    it 'deletes the social media site' do 
      expect{ 
        delete :destroy, id: social_media_site.id
      }.to change(SocialMediaSite,:count).by(-1) 
    end 
    it "redirects to home page" do 
      delete :destroy, id: social_media_site.id
      response.should redirect_to root_path
    end
  end
end