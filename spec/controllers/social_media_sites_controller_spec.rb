require 'spec_helper'

describe SocialMediaSitesController do 
  login_user #defined in spec/support.rb
  let(:social_media_site){ FactoryGirl.build(:social_media_site) }

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

  # context 'get#edit' do
  #   it 'finds the requested social_media_site' do
  #     get :edit, id: social_media_site.id 
  #     expect(assigns[:social_media_site]).to eq(social_media_site) 
  #   end

  #   it 'renders edit template' do 
  #     get :edit, id: social_media_site.id
  #     expect(response).to render_template('edit')
  #   end
  # end

  # context 'put#update' do
  #   context 'given valid attributes' do 
  #     it "changes the social_media_site's attributes" do
  #       put :update, id: social_media_site.id, social_media_site: {first_name: 'Zoe', last_name: 'Barnes', biography: 'I write for Slugline'}
  #       social_media_site.reload
  #       expect(social_media_site.first_name).to eq(social_media_site[:first_name])
  #       expect(social_media_site.last_name).to eq(social_media_site[:last_name])
  #       expect(social_media_site.biography).to eq(social_media_site[:biography])
  #     end
  #     it "redirects to the social_media_site's page" do
  #       put :update, id:social_media_site.id, social_media_site: {first_name: 'Zoe', last_name: 'Barnes', biography: 'I write for Slugline'}
  #       expect(response).to redirect_to social_media_site.find(social_media_site.id) 
  #     end
  #   end
  # end
end