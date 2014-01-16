class User < ActiveRecord::Base
  # Comments
  include TheComments::User

  def comments_moderator? comment
    id == comment.user_id
  end

  def comments_admin?
    true
  end

  # Voting
  acts_as_voter
  # permit duplicates entries of a same voter
  #@hat.vote voter: @user, :duplicate => true

  devise :omniauthable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :items
end
