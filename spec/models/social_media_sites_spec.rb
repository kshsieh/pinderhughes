require 'spec_helper'

describe SocialMediaSite do
  let(:social_media_site){ FactoryGirl.build(:social_media_site) }
  subject{ social_media_site }

  it { should belong_to(:user) }

  it { should validate_presence_of(:site_name) }
  it { should ensure_inclusion_of(:site_name).in_array(%w(facebook instagram tumblr twitter)) }
  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:user_id) }
end