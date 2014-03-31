require 'spec_helper'

describe UsersController do
  let(:user){ FactoryGirl.create(:user)}
  
  context 'get#show' do
    before(:each) do
      get :show, id: user.id
    end

    it 'finds the requested user' do
      expect(assigns[:user]).to eq(user)
    end

    it 'renders show template' do
      expect(response).to render_template :show
    end
  end

end