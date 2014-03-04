require 'spec_helper'

describe User do
  let(:user){ FactoryGirl.build(:user) }
  subject{ user }

  it "has a valid factory" do
    FactoryGirl.build(:user).should be_valid
  end
  
  it { should have_many(:social_media_sites) }

  it{ should accept_nested_attributes_for(:social_media_sites)}
end
