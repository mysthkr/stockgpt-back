class Api::V1::GroceriesController < ApplicationController
  before_action :set_grocery, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:index, :show, :destroy]

  # GET /api/v1/groceries
  def index
    groceries = Grocery.all

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

  # POST /api/v1/groceries
  def create
    grocery = Grocery.new(grocery_params)

    if grocery.save
      render json: grocery, status: :created, location: api_v1_grocery_url(grocery)
    else
      render json: grocery.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/groceries/1
  def update
    grocery = Grocery.find(params[:id])

    if grocery.update(grocery_params)
      render json: grocery
    else
      render json: grocery.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/groceries/1
  def destroy
    grocery = Grocery.find(params[:id])
    grocery.destroy

    render json: { message: 'Grocery successfully deleted.' }
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
