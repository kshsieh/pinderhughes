require 'spec_helper'

describe Blog do
  let(:blog){ FactoryGirl.build(:blog) }
  subject{ blog }

  it "has a valid factory" do
    FactoryGirl.build(:blog).should be_valid
  end

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:entry) }
  it { should validate_presence_of(:user_id) }

  it { should belong_to(:user) }
end

