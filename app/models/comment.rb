class Comment < ActiveRecord::Base
# Assosiations
  belongs_to :item
  belongs_to :user
# Validations
validates :content, presence: true

    #Voting
  acts_as_votable

  # comments tree
  has_ancestry

  def self.highest_voted
    self.order("items.cached_votes_score DESC")
  end


end
