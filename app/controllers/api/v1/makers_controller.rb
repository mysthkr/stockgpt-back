class Api::V1::MakersController < ApplicationController
  # before_action :authenticate_api_v1_user! , only: [:index, :show]

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
    maker = Maker.find(params[:id])
    render json: maker
  end
end
