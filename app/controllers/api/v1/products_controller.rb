class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

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

  # POST /api/v1/products
  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: :created, location: api_v1_product_url(product)
    else
      render json: product.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/products/1
  def update
    product = Product.find(params[:id])

    if product.update(product_params)
      render json: product
    else
      render json: product.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/products/1
  def destroy
    product = Product.find(params[:id])
    product.destroy

    render json: { message: 'Product successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:item_id, :subcategory_id, :category_id, :maker_id, :picture)
    end
end
