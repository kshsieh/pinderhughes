require 'spec_helper'

describe Video do
  let(:video){ FactoryGirl.build(:video) }
  subject{ video }

  it "has a valid factory" do
    FactoryGirl.build(:event).should be_valid
  end

  # it { should validate_presence_of(:tite) } #is title necessary?
  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:user_id) }

  it { should belong_to(:user) }
end