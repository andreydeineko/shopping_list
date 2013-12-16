class Item < ActiveRecord::Base
  include TheComments::Commentable

  belongs_to :user

  # Denormalization methods
  # Please, read about advanced using
  def commentable_title
    try(:title) || "Undefined post title"
  end

  def commentable_url
    ['', self.class.to_s.tableize, id].join('/')
  end

  def commentable_state
    try(:state) || "published"
  end
  # Assosiations
  belongs_to :user
  # Validations
  validates :name, presence: true, uniqueness: true

  scope :recent_first, -> { order('items.created_at DESC') }
end
