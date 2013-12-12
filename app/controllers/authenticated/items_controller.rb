class Authenticated::ItemsController < Authenticated::BaseController

  before_filter :find_item!, only: [ :update, :destroy ]

  def index
    @items = Item.all.page(params[:page]).recent_first
    @item  = Item.new
  end

  def show
    @item = Item.find(params[:id])
    #flash[:error] = "Item's not found" and return unless @item
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
    if @item.update(item_params)
      redirect_to items_path, notice: 'Item was updated'
    else
      render @item.errors.full_messages.join("<br /")
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'Item was deleted'
  end

  private

  def item_params
    params.require(:item).permit(:name, :url)
  end

  def find_item!
    @item = current_user.items.find(params[:id])
  end

end