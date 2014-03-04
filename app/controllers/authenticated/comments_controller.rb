class Authenticated::CommentsController < Authenticated::BaseController
  before_filter :fetch_item, except: [:edit, :update]
  before_filter :fetch_comment, only: [:destroy, :like, :dislike]

  def create
    @comment = current_user.comments.new(comment_params)
 
    @comment.item = @item
    if @comment.save
      redirect_to item_path(@item), notice: I18n.t('flash.authenticated.comments.create.notice')
    else
      redirect_to item_path(@item), alert: I18n.t('flash.authenticated.comments.create.alert')
    end
  end


  def update
    @comment = current_user.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.json { respond_with_bip(@comment) }
      else
        format.json { respond_with_bip(@comment) }
      end
    end
  end

  def destroy
    @comment.destroy
    redirect_to @item, notice: 'Comment was deleted'
  end

  # Voting

  def like
    @comment.upvote_from current_user
    redirect_to @item
  end

  def dislike
    @comment.downvote_from current_user
    redirect_to @item
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :item_id, :user_id, :parent_id)
  end

  def fetch_item  
    @item = Item.find(params[:item_id])
  end

  def fetch_comment
    @comment = @item.comments.find(params[:id])
  end
end

# .merge(:parent_id => params[:parent_id])