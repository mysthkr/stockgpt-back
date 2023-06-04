class Api::V1::ProductsController < ApplicationController
  # before_action :authenticate_api_v1_user! , only: [:index, :show]

  # GET /api/v1/products
  def index
    products = Product.all
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
