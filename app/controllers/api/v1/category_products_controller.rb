class Api::V1::CategoryProductsController < ApplicationController
  before_action :set_category_product, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:index, :show]

  # GET /api/v1/category_products
  def index
    category_products = CategoryProduct.all
    if category_products
      render json: {status: "SUCCESS", message: "Fetched all the products successfully", data: category_products}, status: :ok
    else
      render json: category_products.errors, status: :bad_request
    end
  end

  # GET /api/v1/category_products/1
  def show
    category_product = CategoryProduct.find(params[:id])
    render json: category_product
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_product
      @category_product = CategoryProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_product_params
      params.require(:category_product).permit(:name)
    end
end
