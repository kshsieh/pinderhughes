FactoryGirl.define do
  factory :social_media_site do
    site_name 'Instagram'
    link 'www.instagram.com'
    sequence(:user_id ) { |n| "#{n}"}
  end

  factory :invalid_social_media_site, parent: :social_media_site do
    site_name ''
    link      ''
    user_id   ''
  end
end
