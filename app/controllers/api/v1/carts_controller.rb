class Api::V1::CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:index, :show, :create, :update, :destroy]

  # GET /api/v1/carts
  def index
    carts = Cart.all
    if carts
      render json: {status: "SUCCESS", message: "Fetched all the carts successfully", data: carts}, status: :ok
    else
      render json: carts.errors, status: :bad_request
    end
  end

  # GET /api/v1/carts/1
  def show
    cart = Cart.find(params[:id])
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
    cart = Cart.find(params[:id])

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
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:group_id, :item_id, :criteria, :price, :discarded_at)
    end
end
