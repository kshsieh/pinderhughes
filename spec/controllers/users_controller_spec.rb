require 'spec_helper'

describe UsersController do 
  let(:user){ FactoryGirl.create(:user) }

  context 'get#new' do
    it 'assigns a new User to @user' do
      get :new
      assigns(:user).should be_kind_of(User)
    end
  end

  describe "get#show" do
    it "returns the requested user" do
      get :show, id: user.id
      expect(assigns[:user]).to eq(user)
    end

    it 'renders show view' do 
      get :show, id: user.id
      expect(response).to render_template('show')
    end
  end

  context 'get#edit' do
    it 'finds the requested user' do
      get :edit, id: user.id 
      expect(assigns[:user]).to eq(user) 
    end

    it 'renders edit template' do 
      get :edit, id: user.id
      expect(response).to render_template('edit')
    end
  end

  context 'put#update' do
    before :all do
      @new_attrs = FactoryGirl.attributes_for(:user, first_name: 'Zoe', last_name: 'Barnes', biography: 'I write for Slugline')
      @invalid_attrs = FactoryGirl.attributes_for(:user, first_name: '', last_name: '')
    end

    context 'given valid attributes' do 
      it 'finds the requested user' do
        put :update, id: user.id, user: FactoryGirl.attributes_for(:user)
        expect(assigns[:user]).to eq(user)
      end
      it "changes the user's attributes" do
        put :update, id: user.id, user: @new_attrs
        user.reload
        expect(user.first_name).to eq(@new_attrs[:first_name])
        expect(user.last_name).to eq(@new_attrs[:last_name])
        expect(user.biography).to eq(@new_attrs[:biography])
      end
      it "redirects to the user's page" do
        put :update, id: user.id, user: @new_attrs
        user.reload
        expect(response).to redirect_to User.find(user.id) 
      end
    end

    context 'given invalid attributes' do
      it "does not change the user's attributes" do
        put :update, id: user.id, user: @invalid_attrs
        user.reload
        expect(user.first_name).to eq('Frank')
        expect(user.last_name).to eq('Underwood')
      end
      it 'renders edit template' do
        put :update, id: user.id, user: @invalid_attrs
        user.reload
        expect(response).to render_template('edit')
      end
    end
  end
end