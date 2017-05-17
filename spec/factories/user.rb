FactoryGirl.define do
  factory :user do
    name                  "admin"
    email                 "admin@example.com"
    password              "test"
    password_confirmation "test"
  end
end
