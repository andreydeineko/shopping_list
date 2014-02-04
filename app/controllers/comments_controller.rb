class CommentsController < ApplicationController

  def index
    @comments = Comment.all.page(params[:page])
    @comemnt = Comment.new
  end

  def create
	@comment = current_user.comments.create(comment_params)
	if @item.persisted?
	  redirect_to @comment, notice: I18n.t('flash.authenticated.comments.create.notice')
	else
	  redirect_to @comment, alert: I18n.t('flash.authenticated.comments.create.alert')
	end
  end

  def show
    @comment = Comment.find(params[:id]) 
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    if @comment.update(comment_params)
      redirect_to comments_path, notice: 'Comment was updated'
    else
      render @comment.errors.full_messages.join("<br /")
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_path, notice: 'Comment was deleted'
  end

  # Voting

  def like
    @comment = Item.find_by_id(params[:comment_id])
    @comment.upvote_from current_user
    redirect_to comments_path
  end

  def dislike
    @comment = Item.find_by_id(params[:comment_id])
    @comment.downvote_from current_user
    redirect_to items_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :item_id)
  end

  def find_comment!
    @comment = current_user.comments.find(params[:id])
  end
end
