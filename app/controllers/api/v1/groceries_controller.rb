class Api::V1::GroceriesController < ApplicationController
  # before_action :authenticate_api_v1_user! , only: [:index, :show]

  # GET /api/v1/groceries
  def index
    groceries = Grocery.joins(:item, :category_grocery, :sub_category_grocery)
    .select('groceries.*, items.name as item_name, category_groceries.name as category_grocery_name , 
      sub_category_groceries.name as sub_category_grocery_name')
    # groceries = Grocery.all

    if groceries
      render json: {status: "SUCCESS", message: "Fetched all the groceries successfully", data: groceries}, status: :ok
    else
      render json: groceries.errors, status: :bad_request
    end
  end

  # GET /api/v1/groceries/1
  def show
    grocery = Grocery.find(params[:id])
    render json: grocery
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocery
      grocery = Grocery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grocery_params
      params.require(:grocery).permit(:item_id, :sub_category_grocery_id, :category_grocery_id)
    end
end
