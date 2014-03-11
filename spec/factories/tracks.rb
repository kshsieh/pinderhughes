FactoryGirl.define do
  factory :track do
    link "https://soundcloud.com/holyghostnyc/blood-orange-youre-not-good-enough-holy-ghost-bootleg"
    name "Blood Orange - You're Not Good Enough (Holy Ghost! bootleg)"
    sequence(:user_id) { |n| "#{n}"}
  end

  factory :invalid_track, parent: :track do
    link    ""
    name    ""
    user_id ""
  end
end
