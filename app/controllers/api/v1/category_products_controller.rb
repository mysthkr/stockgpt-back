class Api::V1::CategoryProductsController < ApplicationController
  before_action :set_api_v1_category_product, only: [:show, :update, :destroy]

  # GET /api/v1/category_products
  def index
    @api_v1_category_products = Api::V1::CategoryProduct.all

    render json: @api_v1_category_products
  end

  # GET /api/v1/category_products/1
  def show
    render json: @api_v1_category_product
  end

  # POST /api/v1/category_products
  def create
    @api_v1_category_product = Api::V1::CategoryProduct.new(api_v1_category_product_params)

    if @api_v1_category_product.save
      render json: @api_v1_category_product, status: :created, location: @api_v1_category_product
    else
      render json: @api_v1_category_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/category_products/1
  def update
    if @api_v1_category_product.update(api_v1_category_product_params)
      render json: @api_v1_category_product
    else
      render json: @api_v1_category_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/category_products/1
  def destroy
    @api_v1_category_product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_category_product
      @api_v1_category_product = Api::V1::CategoryProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_category_product_params
      params.require(:api_v1_category_product).permit(:name)
    end
end
