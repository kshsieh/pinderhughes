require 'spec_helper'

describe User do
  let(:user){ FactoryGirl.build(:user) }
  subject{ user }

  it { should validate_presence_of(:first_name)}
  it { should validate_presence_of(:last_name)}
  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:password)}
  it { should have_many(:social_media_sites) }
  it { should have_many(:tracks) }
  it { should have_many(:events) }
  it { should have_many(:videos) }
  it { should have_many(:blogs) }
end
