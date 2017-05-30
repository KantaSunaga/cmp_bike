FactoryGirl.define do
  factory :mangement do
    user_name "テストたろう"
    email "sunagakannta6@gmail.com"
    password "12345678910111"
  end
  factory :mangement1, class: Mangement do
    email "sunagakannta@gmail.com"
    password "1234567891"
  end
end
