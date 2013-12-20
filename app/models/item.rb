class Item < ActiveRecord::Base

  #Comments
  include TheComments::Commentable

  #Voting
  acts_as_votable

  # Assosiations
  belongs_to :user

  # Validations
  validates :name, presence: true, uniqueness: true
  scope :recent_first, -> { order('items.created_at DESC') }


  def self.highest_voted
    self.order("cached_votes_up - cached_votes_down DESC")
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