FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo+#{n}@foodomain.org" }
    password "a_big_secret"
  end
end
