class User < ActiveRecord::Base
  # Comments
  include TheComments::User

  def comments_moderator? comment
    id == comment.user_id
  end

  def comments_admin?
    true
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(name: data["name"], email: data["email"], password: Devise.friendly_token[0,20])
    end
    user
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(name: data["name"], email: data["email"], password: Devise.friendly_token[0,20])
    end
    user
  end

  # Voting
  acts_as_voter
  # permit duplicates entries of a same voter
  #@hat.vote voter: @user, :duplicate => true

  devise :omniauthable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :items
end
