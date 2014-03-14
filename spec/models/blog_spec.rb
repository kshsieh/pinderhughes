require 'spec_helper'

describe Blog do
  let(:blog){ FactoryGirl.build(:blog) }
  subject{ blog }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:entry) }
  it { should validate_presence_of(:user_id) }

  it { should belong_to(:user) }
end

