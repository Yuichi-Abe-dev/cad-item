class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_toppage, only: [:edit, :update, :destroy]
  before_action :search_item, only: [:index, :search]

  def index
    @item = Item.includes(:user)
    set_item_column 
    set_category_column
  end

  def search
    @results = @p.result  # 検索条件にマッチした商品の情報を取得
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

  def move_to_toppage
    redirect_to root_path if current_user.id != @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_item
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_item_column
    @item_name = Item.select("name").distinct  # 重複なくnameカラムのデータを取り出す
  end

  def set_category_column
    @category_name = Item.select("category_id").distinct
  end

end
