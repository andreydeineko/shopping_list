class Authenticated::ItemsController < Authenticated::BaseController
  respond_to :html, :json

  before_filter :find_item!, only: [ :update, :destroy ]

  def index
    @items = Item.all.page(params[:page]).recent_first
    @item  = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.to_a
    @comment = Comment.new(params[:comment_params])
  end

  def create
    @item = current_user.items.create(item_params)
    if @item.persisted?
      redirect_to @item, notice: I18n.t('flash.authenticated.items.create.notice')
    else
      redirect_to @item, alert: I18n.t('flash.authenticated.items.create.alert')
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
         format.json { respond_with_bip(@item) }
      else
         format.json {  respond_with_bip(@item) }
      end
    end  
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'Item was deleted'
  end

  # Voting

  def like
    @item = Item.find_by_id(params[:item_id])
    @item.upvote_from current_user
    redirect_to items_path
  end

  def dislike
    @item = Item.find_by_id(params[:item_id])
    @item.downvote_from current_user
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :URL, :category, :amount)
  end

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end

  def find_item!
    @item = current_user.items.find(params[:id])
  end

end
