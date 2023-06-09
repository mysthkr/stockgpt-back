class Api::V1::CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:index, :show, :create, :update, :destroy]
  before_action :set_group_id, only: [:create, :update, :destroy]
  before_action -> { ensure_user_index("carts") }, only: [:index]
  before_action -> { ensure_user_params_id("carts") }, only: [:show, :update, :destroy]

  # GET /api/v1/carts
  def index
    # carts = Cart.where(group_id: current_api_v1_user.group_id)
    carts = Cart.joins(:item)
    .left_outer_joins(item: [{ product: [:category_product, :sub_category_product] },
      { grocery: [:category_grocery, :sub_category_grocery] }])
      .where(group_id: current_api_v1_user.group_id)
      .select('carts.*, items.name as item_name, products.picture as product_picture,
              category_products.name as category_product_name, 
              sub_category_products.name as sub_category_product_name, 
              category_groceries.name as category_grocery_name, 
              sub_category_groceries.name as sub_category_grocery_name')
      .distinct('carts.id')

    # .select('carts.*, 
    #   items.name as item_name')
    puts "yeaaaaaaaaaaaaaaaaa"
    pp carts
    if carts
      render json: {status: "SUCCESS", message: "Fetched all the carts successfully", data: carts}, status: :ok
    else
      render json: carts.errors, status: :bad_request
    end
  end

  # GET /api/v1/carts/1
  def show
    # cart = Cart.find(params[:id]).where(group_id: current_api_v1_user.group_id)
    cart = Cart.where(id: params[:id], group_id: current_api_v1_user.group_id)
    render json: cart
  end

  # POST /api/v1/carts
  def create
    puts cart_params
    cart = Cart.new(cart_params)
    if cart.save
      render json: cart, status: :created, location: api_v1_cart_url(cart)
    else
      render json: cart.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/carts/1
  def update
    cart = Cart.where(id: params[:id], group_id: current_api_v1_user.group_id)

    if cart.update(cart_params)
      render json: cart
    else
      render json: cart.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/carts/1
  def destroy
    cart = Cart.find(params[:id])
    cart.destroy

    render json: { message: 'Cart successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:group_id, :item_id, :criteria, :price, :discarded_at)
    end

    def set_group_id
      params[:cart][:group_id] = current_api_v1_user.group_id
    end
end
