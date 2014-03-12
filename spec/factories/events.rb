FactoryGirl.define do
  factory :event do 
    date_time      DateTime.now + 6.hours
    link          'www.thecaffiends.com'
    venue         'No Future Cafe'
    other_artists 'The Caffiends'
  end

  factory :invalid_event, parent: :event do 
    date_time      DateTime.now - 6.hours
    link          ''
    venue         ''
    other_artists ''
  end
end