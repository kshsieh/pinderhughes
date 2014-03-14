require 'spec_helper'

describe Event do
  let(:event){FactoryGirl.create(:event)}
  subject{ event }

  it { should validate_presence_of(:date_time) }
  it { should validate_presence_of(:venue) }
  it { should validate_presence_of(:user_id) }
  
  it { should belong_to(:user) }
end