class Api::V1::CategoryGroceriesController < ApplicationController
  before_action :set_category_grocery, only: [:show, :update, :destroy]

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

  # POST /api/v1/category_groceries
  def create
    category_grocery = CategoryGrocery.new(category_grocery_params)
    if category_grocery.save
      render json: category_grocery, status: :created, location: api_v1_category_grocery_url(category_grocery)
    else
      render json: category_grocery.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/category_groceries/1
  def update
    category_grocery = CategoryGrocery.find(params[:id])

    if category_grocery.update(category_grocery_params)
      render json: category_grocery
    else
      render json: category_grocery.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/category_groceries/1
  def destroy
    category_grocery = CategoryGrocery.find(params[:id])
    category_grocery.destroy

    render json: { message: 'CategoryGrocery successfully deleted.' }
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
