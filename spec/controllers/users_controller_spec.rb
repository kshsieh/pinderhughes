require 'spec_helper'

describe UsersController do 
  let(:user){ FactoryGirl.create(:user) }

  context 'get#new' do
    it 'assigns a new User to @user' do
      get :new
      assigns(:user).should be_kind_of(User)
    end
  end

  context 'get#edit' do
    it 'finds the requested user' do
      get :edit, id: user.id
      # expect(assigns[:user].id).to eq(user.id) 
      expect(assigns[:user]).to eq(user) 
    end

    it 'renders edit template' do 
      get :edit, id: user.id
      expect(response).to render_template('edit')
    end
  end

  context 'put#update' do
    context 'given valid attributes' do 
      it "changes the user's attributes" do
        put :update, id: user.id, user: {first_name: 'Zoe', last_name: 'Barnes', biography: 'I write for Slugline'}
        user.reload
        expect(user.first_name).to eq(user[:first_name])
        expect(user.last_name).to eq(user[:last_name])
        expect(user.biography).to eq(user[:biography])
      end
      it "redirects to the user's page" do
        put :update, id:user.id, user: {first_name: 'Zoe', last_name: 'Barnes', biography: 'I write for Slugline'}
        expect(response).to redirect_to User.find(user.id) 
      end
    end
  end
end