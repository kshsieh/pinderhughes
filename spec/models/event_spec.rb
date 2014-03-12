require 'spec_helper'

describe Event do
  let(:event){FactoryGirl.create(:event)}
  subject{ event }
 
  it "has a valid factory" do
    FactoryGirl.build(:event).should be_valid
  end

  it { should validate_presence_of(:date_time) }
  it { should validate_presence_of(:venue) }
  it { should belong_to(:user) }
end