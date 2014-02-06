class Authenticated::CommentsController < Authenticated::BaseController
  before_filter :fetch_item
  before_filter :fetch_comment, only: [:edit, :update, :destroy, :like, :dislike]

  def create
    @comment = current_user.comments.new(comment_params)
 
    @comment.item = @item
    if @comment.save
      redirect_to item_path(@item), notice: I18n.t('flash.authenticated.comments.create.notice')
    else
      redirect_to item_path(@item), alert: I18n.t('flash.authenticated.comments.create.alert')
    end
  end


  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to item_path(@item), notice: 'Comment was updated'
    else
      render @comment.errors.full_messages.join("<br /")
    end
  end

  def destroy
    @comment.destroy
    redirect_to @item, notice: 'Comment was deleted'
  end

  # Voting

  def like
    @comment = Item.find_by_id(params[:comment_id])
    @comment.upvote_from current_user
    redirect_to @comment
  end

  def dislike
    @comment = Item.find_by_id(params[:comment_id])
    @comment.downvote_from current_user
    redirect_to @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :item_id, :user_id)
  end

  def find_comment!
    @comment = current_user.comments.find(params[:id])
  end

  def fetch_item  
    @item = Item.find(params[:item_id])
  end
  def fetch_comment
    @comment = @item.comments.find(params[:id])
  end
end
