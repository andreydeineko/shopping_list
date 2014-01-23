class Comment < ActiveRecord::Base
  include TheComments::Comment

  #VOTING
    acts_as_votable

    def self.highest_voted
      self.order("comments.cached_votes_score DESC")
    end


  # ---------------------------------------------------
  # Define comment's avatar url
  # Usually we use Comment#user (owner of comment) to define avatar
  # @item.comments.includes(:user) #<= use includes(:user) to decrease queries count
  #comment#user.avatar_url
  # ---------------------------------------------------

  # public
  # ---------------------------------------------------
  # Simple way to define avatar url
  #
  def avatar_url
    src = id.to_s

  end
  # ---------------------------------------------------

  # private
  # ---------------------------------------------------
  # Define your content filters
  # gem 'RedCloth'
  # gem 'sanitize'
  # gem 'MySmilesProcessor'
  #
  # def prepare_content
  #   text = self.raw_content
  #   text = RedCloth.new(text).to_html
  #   text = MySmilesProcessor.new(text)
  #   text = Sanitize.clean(text, Sanitize::Config::RELAXED)
  #   self.content = text
  # end
  # ---------------------------------------------------
end