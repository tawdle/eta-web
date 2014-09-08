# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting do
    user
    description "My important meeting"
    location "543 Howard Street, San Francisco, CA, United States"
  end
end
