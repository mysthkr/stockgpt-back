class Api::V1::Admin::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :admin_athenticate, :authenticate_api_v1_user!

  # GET /api/v1/items
  def index
    items = Item.all
    if items
      render json: {status: "SUCCESS", message: "Fetched all the items successfully", data: items}, status: :ok
    else
      render json: items.errors, status: :bad_request
    end
  end

  # GET /api/v1/items/1
  def show
    item = Item.find(params[:id])
    render json: item
  end

  # POST /api/v1/items
  def create
    item = Item.new(item_params)
    if item.save
      render json: item, status: :created, location: api_v1_item_url(item)
    else
      render json: item.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/items/1
  def update
    item = Item.find(params[:id])

    if item.update(item_params)
      render json: item
    else
      render json: item.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/items/1
  def destroy
    item = Item.find(params[:id])
    item.destroy

    render json: { message: 'Item successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :criteria)
    end
end
