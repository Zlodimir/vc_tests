FactoryGirl.define do
  factory :feedback do
    email { Faker::Internet.email }
    text { Faker::Lorem.sentences(1) }
  end
end
