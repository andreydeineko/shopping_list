class User < ActiveRecord::Base
  include TheComments::User
  def admin?
  end

  def comments_admin?
  end
  def comments_moderator? comment
    id == comment.holder_id
  end

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :items
end
