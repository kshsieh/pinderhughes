require 'spec_helper'

describe InTheFutureValidator do
  it 'validates that value is a future date from now' do
    event = Event.create(venue: 'venue', date_time: DateTime.now - 1.week)
    expect(event).to_not be_valid
  end
end