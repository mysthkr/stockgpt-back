class Api::V1::Admin::MakersController < ApplicationController
  before_action :set_maker, only: [:show, :update, :destroy]
  before_action :admin_athenticate, :authenticate_api_v1_user!

  # GET /api/v1/makers
  def index
    makers = Maker.all
    if makers
      render json: {status: "SUCCESS", message: "Fetched all the makers successfully", data: makers}, status: :ok
    else
      render json: makers.errors, status: :bad_request
    end
  end

  # GET /api/v1/makers/1
  def show
    render json: @maker
  end

  # POST /api/v1/makers
  def create
    maker = Maker.new(maker_params)
    if maker.save
      render json: maker, status: :created, location: api_v1_maker_url(maker)
    else
      render json: maker.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/makers/1
  def update
    if @maker.update(maker_params)
      render json: @maker
    else
      render json: @maker.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/makers/1
  def destroy
    @maker.destroy

    render json: { message: 'Maker successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maker
      @maker = Maker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maker_params
      params.require(:maker).permit(:name)
    end
end
