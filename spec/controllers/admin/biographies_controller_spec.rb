require 'spec_helper'

describe Admin::BiographiesController do 
  let(:biography){FactoryGirl.create(:biography)}

  context 'get#edit' do
    it 'finds the requested user' do
      get :edit, id: biography.id
      expect(assigns[:biography].id).to eq(biography.id) 
    end

    it 'renders edit template' do 
      get :edit, id: biography.id
      expect(response).to render_template('edit')
    end
  end

  context 'put#update' do
    it 'finds the requested biography' do
      put :update, id: biography.id, biography: {content: 'test text'}
      expect(assigns[:biography].id).to eq(biography.id) 
    end
    
    context 'given valid attributes' do 
      it "changes the user's attributes" do
        put :update, id: biography.id, biography: {content: 'test text'}
        biography.reload
        expect(biography.content).to eq('test text')
      end
      it "redirects to the biography page" do
        pending #when implementing control flow for type of content
      end
    end
  end
end