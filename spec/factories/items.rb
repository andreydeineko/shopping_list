FactoryGirl.define do
  factory :item do
  	sequence(:name) { |seq| "Item-#{seq}" }
  	url "http://www.imdb.com/chart/top"

  	user
  end
end
