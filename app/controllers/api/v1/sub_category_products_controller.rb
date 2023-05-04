class Api::V1::SubCategoryProductsController < ApplicationController
  before_action :set_sub_category_product, only: [:show, :update, :destroy]

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

  # POST /api/v1/sub_category_products
  def create
    sub_category_product = SubCategoryProduct.new(sub_category_product_params)
    if sub_category_product.save
      render json: sub_category_product, status: :created, location: api_v1_sub_category_product_url(sub_category_product)
    else
      render json: sub_category_product.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/sub_category_products/1
  def update
    sub_category_product = SubCategoryProduct.find(params[:id])

    if sub_category_product.update(sub_category_product_params)
      render json: sub_category_product
    else
      render json: sub_category_product.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/sub_category_products/1
  def destroy
    sub_category_product = SubCategoryProduct.find(params[:id])
    sub_category_product.destroy

    render json: { message: 'SubCategoryProduct successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_category_product
      sub_category_product = SubCategoryProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_category_product_params
      params.require(:sub_category_product).permit(:name, :category_id)
    end
end
