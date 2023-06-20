class Api::V1::FavoritesController < ApplicationController
  # before_action :set_favorite, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:index, :show, :create, :destroy]
  before_action :set_group_id, only: [:create, :update, :destroy]
  before_action -> { ensure_user_index("favorites") }, only: [:index]
  # before_action -> { ensure_user_params_id("favorites") }, only: [:show, :update, :destroy]

  # GET /api/v1/favorites
  def index
    favorites = Favorite
    .joins(:item)
    .left_outer_joins(item: [{ product: [:category_product, :sub_category_product] },
      { grocery: [:category_grocery, :sub_category_grocery] }])
    .where(group_id: current_api_v1_user.group_id)
    .select('favorites.*,  items.name as item_name, products.picture as product_picture,
      category_products.name as category_product_name, 
      sub_category_products.name as sub_category_product_name, 
      category_groceries.name as category_grocery_name, 
      sub_category_groceries.name as sub_category_grocery_name')
    .distinct('favorites.id')
    # favorites = Favorite.where(group_id: current_api_v1_user.group_id)
    pp favorites
    puts favorites.to_json
    
    if favorites
      render json: {status: "SUCCESS", message: "Fetched all the favorites successfully", data: favorites}, status: :ok
    else
      render json: favorites.errors, status: :bad_request
    end
  end

  # GET /api/v1/favorites/1
  # def show
  #   favorite = Favorite.where(id: params[:id], group_id: current_api_v1_user.group_id)
  #   render json: favorite
  # end

  # POST /api/v1/favorites
  def create
    puts "favorite_params"
    puts favorite_params
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render json: favorite, status: :created, location: api_v1_favorite_url(favorite)
    else
      render json: favorite.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/favorites/1
  # def update
  #   favorite = Favorite.where(id: params[:id], group_id: current_api_v1_user.group_id)

  #   if favorite.update(favorite_params)
  #     render json: favorite
  #   else
  #     render json: favorite.errors, status: :bad_request
  #   end
  # end

  # DELETE /api/v1/favorites/1
  def destroy
    puts "params"
    puts params
    puts params[:item_id]
    puts params[:id]
    # favorite = Favorite.where(params[:id])
    favorite = Favorite.where(group_id: params[:favorite][:group_id],item_id: params[:id])
    puts "favorite"
    pp favorite
    favorite.destroy_all

    render json: { message: 'Favorite successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_params
      params.require(:favorite).permit(:group_id, :item_id)
    end
    
    def set_group_id
      params[:favorite][:group_id] = current_api_v1_user.group_id
    end
end
