require 'spec_helper'

describe SocialMediaSite do
  let(:social_media_site){ FactoryGirl.build(:social_media_site) }
  subject{ social_media_site }

  it { should belong_to(:user) }

  it { should validate_presence_of(:site_name) }
  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:user_id) }
end