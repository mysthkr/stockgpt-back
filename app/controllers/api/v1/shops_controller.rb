class Api::V1::ShopsController < ApplicationController
  before_action :authenticate_api_v1_user! , only: [:index, :show]

  # GET /api/v1/shops
  def index
    shops = Shop.all
    if shops
      render json: {status: "SUCCESS", message: "Fetched all the shops successfully", data: shops}, status: :ok
    else
      render json: shops.errors, status: :bad_request
    end
  end

  # GET /api/v1/shops/1
  def show
    shop = Shop.find(params[:id])
    render json: shop
  end
end
