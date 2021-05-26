class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render item_path(@item.id)
    end
  end 

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :software_id, :version, :operating_system_id, :status_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
