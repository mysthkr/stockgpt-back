class Api::V1::CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:index, :show, :create, :update, :destroy]
  before_action -> { ensure_user_index("carts") }, only: [:index]
  before_action -> { ensure_user_params_id("carts") }, only: [:show, :update, :destroy]

  # before_action :user_eq_group_authenticate

  # GET /api/v1/carts
  def index
    carts = Cart.where(group_id: current_api_v1_user.group_id)
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

    # def user_eq_group_authenticate
    #   unless current_api_v1_user.group_id == cart.group_id
    #     head :unauthorized
    #   end
    # end

    # def ensure_user
    #   @carts = current_api_v1_user.group.carts
    #   @cart = @carts.find_by(id: params[:id])
    #   head :unauthorized unless @cart
    # end
end
