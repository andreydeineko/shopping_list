class Comment < ActiveRecord::Base
# Assosiations
  belongs_to :item
  belongs_to :user

    #Voting
  acts_as_votable

  def self.highest_voted
    self.order("items.cached_votes_score DESC")
  end
end
