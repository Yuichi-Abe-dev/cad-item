class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :software_id, :version, :operating_system_id, :status_id, :image).merge(user_id: current_user.id)
  end
end
