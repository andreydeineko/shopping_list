class User < ActiveRecord::Base

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

  # Validations
  validates :name, presence: true, uniqueness: true
   validates :email, presence: true, uniqueness: true

  devise :omniauthable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Assosiations
  has_many :items
  has_many :comments
end
