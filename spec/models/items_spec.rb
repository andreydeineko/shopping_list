require 'spec_helper'

describe Item do
  it { should belong_to(:user) }

  it { should validate_presence_of(:name)   }
  it { should validate_uniqueness_of(:name) }

  let(:user) { FactoryGirl.create(:user) }

  describe 'Class Methods' do
    describe '#highest_voted' do
      it 'orders items by highest rating desc' do
        5.times { FactoryGirl.create(:item, user: user) }
        highest_rated_item = Item.last
        highest_rated_item.update_attributes(cached_votes_score: 10)

        Item.highest_voted.first.should == highest_rated_item
      end
    end
  end
end
