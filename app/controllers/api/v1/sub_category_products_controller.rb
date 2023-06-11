class Api::V1::SubCategoryProductsController < ApplicationController
  before_action :set_sub_category_product, only: [:show]
  # before_action :authenticate_api_v1_user! , only: [:index, :show]

  # GET /api/v1/sub_category_products
  def index
    sub_category_products = SubCategoryProduct.all
    if sub_category_products
      render json: {status: "SUCCESS", message: "Fetched all the products successfully", data: sub_category_products}, status: :ok
    else
      render json: sub_category_products.errors, status: :bad_request
    end
  end

  # GET /api/v1/sub_category_products/1
  def show
    sub_category_product = SubCategoryProduct.find(params[:id])
    render json: sub_category_product
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_category_product
      sub_category_product = SubCategoryProduct.find(params[:id])
    end
end
