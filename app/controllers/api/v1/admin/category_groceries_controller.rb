class Api::V1::Admin::CategoryGroceriesController < Api::V1::CategoryGroceriesController
  before_action :admin_athenticate, :authenticate_api_v1_user!

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
