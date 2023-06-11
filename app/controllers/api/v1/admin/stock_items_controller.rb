class Api::V1::Admin::StockItemsController < ApplicationController
  before_action :set_stock_item, only: [:show, :update, :destroy]
  before_action :admin_athenticate, :authenticate_api_v1_user!

  # GET /api/v1/stock_items
  def index
    stock_items = StockItem.all
    if stock_items
      render json: {status: "SUCCESS", message: "Fetched all the stock_items successfully", data: stock_items}, status: :ok
    else
      render json: stock_items.errors, status: :bad_request
    end
  end

  # GET /api/v1/stock_items/1
  def show
    stock_item = StockItem.find(params[:id])
    render json: stock_item
  end

  # POST /api/v1/stock_items
  def create
    stock_item = StockItem.new(stock_item_params)
    if stock_item.save
      render json: stock_item, status: :created, location: api_v1_stock_item_url(stock_item)
    else
      render json: stock_item.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/stock_items/1
  def update
    stock_item = StockItem.find(params[:id])

    if stock_item.update(stock_item_params)
      render json: stock_item
    else
      render json: stock_item.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/stock_items/1
  def destroy
    stock_item = StockItem.find(params[:id])
    stock_item.destroy

    render json: { message: 'StockItem successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_item
      stock_item = StockItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_item_params
      params.require(:stock_item).permit(:group_id, :criteria, :item_id, :alarm_date, :price, :shop_id, :quantity, :discarded_at)
    end
end
