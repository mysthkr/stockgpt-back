class Api::V1::SubCategoryGroceriesController < ApplicationController
  before_action :set_sub_category_grocery, only: [:show]
  # before_action :authenticate_api_v1_user! , only: [:index, :show]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_category_grocery
      sub_category_grocery = SubCategoryGrocery.find(params[:id])
    end
end
