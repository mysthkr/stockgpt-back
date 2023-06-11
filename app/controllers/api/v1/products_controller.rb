class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_api_v1_user! , only: [:index, :show]

  # GET /api/v1/products
  def index
    # products = Product.all
    products = Product.joins(:item, :category_product, :sub_category_product, :maker)
    .select('products.*, items.name as item_name, category_products.name as category_product_name , 
      sub_category_products.name as sub_category_product_name, makers.name as maker_name')

    if products
      render json: {status: "SUCCESS", message: "Fetched all the products successfully", data: products}, status: :ok
    else
      render json: products.errors, status: :bad_request
    end
  end

  # GET /api/v1/products/1
  def show
    product = Product.find(params[:id])
    render json: product
  end
end
