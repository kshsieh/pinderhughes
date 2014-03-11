require 'spec_helper'

describe Track do 
  let(:track){ FactoryGirl.build(:track)}
  subject{ track }

  it "has a valid factory" do
    FactoryGirl.build(:track).should be_valid
  end

  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }

  it { should belong_to(:user)}
end