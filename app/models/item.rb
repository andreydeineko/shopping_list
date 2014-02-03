class Item < ActiveRecord::Base
  CATEGORIES = ["food", "office", "bathroom", "other"]
  #Comments
  include TheComments::Commentable

  #Voting
  acts_as_votable

  # Assosiations
  belongs_to :user

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :URL, :format => URI::regexp(%w(http https)), allow_blank: true
  
  scope :recent_first, -> { order('items.created_at DESC') }

  def commentable_state
    "published"
  end

  def self.highest_voted
    self.order("items.cached_votes_score DESC")
  end
  # Item.highest_voted
end



# def commentable_title
#   try(:title) || "Undefined post title"
# end

# def commentable_url
#   ['', self.class.to_s.tableize, id].join('/')
# end

# def commentable_state
#   try(:state) || "published"
# end
