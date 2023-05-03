class Api::V1::CategoryGroceriesController < ApplicationController
  before_action :set_api_v1_category_grocery, only: [:show, :update, :destroy]

  # GET /api/v1/category_groceries
  def index
    @api_v1_category_groceries = Api::V1::CategoryGrocery.all

    render json: @api_v1_category_groceries
  end

  # GET /api/v1/category_groceries/1
  def show
    render json: @api_v1_category_grocery
  end

  # POST /api/v1/category_groceries
  def create
    @api_v1_category_grocery = Api::V1::CategoryGrocery.new(api_v1_category_grocery_params)

    if @api_v1_category_grocery.save
      render json: @api_v1_category_grocery, status: :created, location: @api_v1_category_grocery
    else
      render json: @api_v1_category_grocery.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/category_groceries/1
  def update
    if @api_v1_category_grocery.update(api_v1_category_grocery_params)
      render json: @api_v1_category_grocery
    else
      render json: @api_v1_category_grocery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/category_groceries/1
  def destroy
    @api_v1_category_grocery.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_category_grocery
      @api_v1_category_grocery = Api::V1::CategoryGrocery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_category_grocery_params
      params.require(:api_v1_category_grocery).permit(:name)
    end
end
