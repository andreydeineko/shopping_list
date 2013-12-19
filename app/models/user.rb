class User < ActiveRecord::Base
  # Comments
  include TheComments::User

  def comments_moderator? comment
    id == comment.holder_id
  end

  # Voting
  acts_as_voter
  # permit duplicates entries of a same voter
  #@hat.vote voter: @user, :duplicate => true

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :items
end
