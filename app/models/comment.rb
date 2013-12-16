class Comment < ActiveRecord::Base
  include TheComments::Comment
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
    src = title unless title.blank?
    "https://lh6.googleusercontent.com/-PLY81XFPULo/AAAAAAAAAAI/AAAAAAAAAFI/rW7gRvW3Mp4/photo.jpg"
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