require 'spec_helper'

describe SocialMediaSite do
  let(:social_media_site){ FactoryGirl.build(:social_media_site) }
  subject{ social_media_site }

  it "has a valid factory" do
    FactoryGirl.build(:social_media_site).should be_valid
  end
  
  it { should belong_to(:user) }

  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:user_id) }
end