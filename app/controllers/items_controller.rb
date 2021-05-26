class ItemsController < ApplicationController
  def index
    @item = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item= Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :software_id, :version, :operating_system_id, :status_id, :image).merge(user_id: current_user.id)
  end
end
