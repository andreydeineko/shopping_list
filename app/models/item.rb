class Item < ActiveRecord::Base

  # Assosiations
  belongs_to :user
  # Validations
  validates :name, presence: true, uniqueness: true

  scope :recent_first, -> { order('items.created_at DESC') }
end
