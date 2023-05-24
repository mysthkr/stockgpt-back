class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:index, :show]

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
