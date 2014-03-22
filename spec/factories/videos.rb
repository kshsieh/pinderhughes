FactoryGirl.define do
  factory :video do
    title "15-Yr-Old Kelvin Doe Wows M.I.T."
    link "http://www.youtube.com/watch?v=XOLOLrUBRBY"
    sequence(:user_id) {|n| "#{n}"}
  end

  factory :invalid_video, parent: :video do
    title ''
    link ''
    user_id ''
  end
end