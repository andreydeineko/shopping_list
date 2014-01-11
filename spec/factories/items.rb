FactoryGirl.define do
  factory :items do
  	sequence(:name) { |seq| "Item-#{seq}" }
  	url "http://www.imdb.com/chart/top"

  	user #assosiation
  end
end