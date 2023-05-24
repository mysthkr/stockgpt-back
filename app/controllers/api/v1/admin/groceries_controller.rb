class Api::V1::Admin::GroceriesController < Api::V1::GroceriesController
  before_action :admin_athenticate, :authenticate_api_v1_user!

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
end
