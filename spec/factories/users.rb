FactoryGirl.define do
  factory :user do
  	sequence(:name)  { |seq| "User-#{seq}" }
  	sequence(:email) { |seq| "user-#{seq}@gmail.com" }
  	password "user-password"
  end
end