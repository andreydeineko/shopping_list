class Item < ActiveRecord::Base
  CATEGORIES = ["food", "office", "bathroom", "other"]

  #Voting
  acts_as_votable

  # Assosiations
  belongs_to :user
  has_many :comments

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :URL, :format => URI::regexp(%w(http https)), allow_blank: true
  
  scope :recent_first, -> { order('items.created_at DESC') }

  def self.highest_voted
    self.order("items.cached_votes_score DESC")
  end
  # Item.highest_voted
end