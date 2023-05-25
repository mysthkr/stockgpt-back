class Api::V1::RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:create]

  # POST /api/v1/requests
  def create
    request = Request.new(request_params)
    if request.save
      render json: request, status: :created, location: api_v1_request_url(request)
    else
      render json: request.errors, status: :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:user_id, :request_type, :request_name, :register_flag)
    end
end
