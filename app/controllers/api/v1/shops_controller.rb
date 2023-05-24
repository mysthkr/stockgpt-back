class Api::V1::ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:index, :show]
  # , only: [:create, :update, :destroy]
  #user index show

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

  # POST /api/v1/shops
  def create
    shop = Shop.new(shop_params)
    if shop.save
      render json: shop, status: :created, location: api_v1_shop_url(shop)
    else
      render json: shop.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/shops/1
  def update
    shop = Shop.find(params[:id])

    if shop.update(shop_params)
      render json: shop
    else
      render json: shop.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/shops/1
  def destroy
    shop = Shop.find(params[:id])
    shop.destroy

    render json: { message: 'Shop successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      shop = Shop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_params
      params.require(:shop).permit(:name, :prefecture)
    end
end
