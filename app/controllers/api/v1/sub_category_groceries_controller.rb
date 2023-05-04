class Api::V1::SubCategoryGroceriesController < ApplicationController
  before_action :set_sub_category_grocery, only: [:show, :update, :destroy]

  # GET /api/v1/sub_category_groceries
  def index
    sub_category_groceries = SubCategoryGrocery.all
    if sub_category_groceries
      render json: {status: "SUCCESS", message: "Fetched all the groceries successfully", data: sub_category_groceries}, status: :ok
    else
      render json: sub_category_groceries.errors, status: :bad_request
    end
  end

  # GET /api/v1/sub_category_groceries/1
  def show
    sub_category_grocery = SubCategoryGrocery.find(params[:id])
    render json: sub_category_grocery
  end

  # POST /api/v1/sub_category_groceries
  def create
    sub_category_grocery = SubCategoryGrocery.new(sub_category_grocery_params)
    if sub_category_grocery.save
      render json: sub_category_grocery, status: :created, location: api_v1_sub_category_grocery_url(sub_category_grocery)
    else
      render json: sub_category_grocery.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/sub_category_groceries/1
  def update
    sub_category_grocery = SubCategoryGrocery.find(params[:id])

    if sub_category_grocery.update(sub_category_grocery_params)
      render json: sub_category_grocery
    else
      render json: sub_category_grocery.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/sub_category_groceries/1
  def destroy
    sub_category_grocery = SubCategoryGrocery.find(params[:id])
    sub_category_grocery.destroy

    render json: { message: 'SubCategoryGrocery successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_category_grocery
      sub_category_grocery = SubCategoryGrocery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_category_grocery_params
      params.require(:sub_category_grocery).permit(:name, :category_id)
    end
end
