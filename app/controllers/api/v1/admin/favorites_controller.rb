class Api::V1::Admin::FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :update, :destroy]
  before_action :admin_athenticate, :authenticate_api_v1_user!

  # GET /api/v1/favorites
  def index
    favorites = Favorite.all
    if favorites
      render json: {status: "SUCCESS", message: "Fetched all the favorites successfully", data: favorites}, status: :ok
    else
      render json: favorites.errors, status: :bad_request
    end
  end

  # GET /api/v1/favorites/1
  def show
    favorite = Favorite.find(params[:id])
    render json: favorite
  end

  # POST /api/v1/favorites
  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render json: favorite, status: :created, location: api_v1_favorite_url(favorite)
    else
      render json: favorite.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/favorites/1
  def update
    favorite = Favorite.find(params[:id])

    if favorite.update(favorite_params)
      render json: favorite
    else
      render json: favorite.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/favorites/1
  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy

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
end
