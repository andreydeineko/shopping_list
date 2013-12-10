class Item < ActiveRecord::Base

  # Assosiations
  belongs_to :user
  acts_as_list

  # Validations
  validates :name, presence: true, uniqueness: true

  scope :recent_first, -> { order('items.created_at DESC') }
end
