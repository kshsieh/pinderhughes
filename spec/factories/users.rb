# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@example.com"}
    password   'foobarbaz'
    first_name 'Frank'
    last_name  'Underwood'
    biography  "I’ve always loathed the necessity of sleep. Like death, it puts even the most powerful men on their backs."
    admin       true
  end
end
