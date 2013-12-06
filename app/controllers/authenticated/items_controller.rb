class Authenticated::ItemsController < Authenticated::BaseController

  before_filter :find_item!, only: [ :update, :destroy ]

  def create
    @item = @list.items.create(item_params)
    if @item.persisted?
      render json: { entry: render_to_string(partial: 'item', locals: { item: @item }), message: I18n.t('flash.authenticated.items.create.notice') },
             status: 202
    else
      render json: { errors: @item.errors }, status: 422
    end

    redirect_to :show
  end

  def show
    @items = Item.all
  end

  def destroy
    current_user.items.where(id: params[:item][:item_ids]).destroy_all

    render nothing: true, status: 200
  end

  def update
    if @item.update(item_params)
      render json: @item, status: 202
    else
      render @item.errors.full_messages.join("<br /")
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def find_item!
    @item = current_user.items.find(params[:id])
  end


end
