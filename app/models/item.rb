class Item < ActiveRecord::Base

  after_create :send_notification

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

  def send_notification
    NotificationMailer.new_item(self).deliver
  end

  def self.highest_voted
    self.order("items.cached_votes_score DESC")
  end
end