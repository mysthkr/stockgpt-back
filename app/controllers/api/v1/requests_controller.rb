class Api::V1::RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]

  # GET /api/v1/requests
  def index
    requests = Request.all
    if requests
      render json: {status: "SUCCESS", message: "Fetched all the requests successfully", data: requests}, status: :ok
    else
      render json: requests.errors, status: :bad_request
    end
  end

  # GET /api/v1/requests/1
  def show
    request = Request.find(params[:id])
    render json: request
  end

  # POST /api/v1/requests
  def create
    request = Request.new(request_params)
    if request.save
      render json: request, status: :created, location: api_v1_request_url(request)
    else
      render json: request.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/requests/1
  def update
    request = Request.find(params[:id])

    if request.update(request_params)
      render json: request
    else
      render json: request.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/requests/1
  def destroy
    request = Request.find(params[:id])
    request.destroy

    render json: { message: 'Request successfully deleted.' }
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
