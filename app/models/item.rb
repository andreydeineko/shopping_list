class Item < ActiveRecord::Base

  # Assosiations
  belongs_to :user
<<<<<<< HEAD
  acts_as_list
=======
  acts_as_list scope: :list
>>>>>>> 6c37f9050934652b7b792decad6aad3aaf1b207e

  # Validations
  validates :name, presence: true
  with_options if: -> { name.present? } do
    validates :name, uniqueness: { :scope => :project_id }
  end

<<<<<<< HEAD
=======
  default_scope        -> { order('items.position DESC') }
>>>>>>> 6c37f9050934652b7b792decad6aad3aaf1b207e
  scope :recent_first, -> { order('items.created_at DESC') }
end
