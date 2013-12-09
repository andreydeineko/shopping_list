class Item < ActiveRecord::Base

  # Assosiations
  belongs_to :user
  acts_as_list

  # Validations
  validates :name, presence: true
  with_options if: -> { name.present? } do
    validates :name, uniqueness: { :scope => :project_id }
  end

  scope :recent_first, -> { order('items.created_at DESC') }
end
