class Api::V1::CategoryGroceriesController < ApplicationController
  before_action :set_category_grocery, only: [:show, :update, :destroy]
  # before_action :authenticate_api_v1_user! , only: [:index, :show]
  
  # GET /api/v1/category_groceries
  def index
    category_groceries = CategoryGrocery.all
    if category_groceries
      render json: {status: "SUCCESS", message: "Fetched all the groceries successfully", data: category_groceries}, status: :ok
    else
      render json: category_groceries.errors, status: :bad_request
    end
  end

  # GET /api/v1/category_groceries/1
  def show
    category_grocery = CategoryGrocery.find(params[:id])
    render json: category_grocery
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_grocery
      @category_grocery = CategoryGrocery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_grocery_params
      params.require(:category_grocery).permit(:name)
    end
end
