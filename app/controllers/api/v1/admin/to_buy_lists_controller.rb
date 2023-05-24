class Api::V1::Admin::ToBuyListsController < ApplicationController
  before_action :set_to_buy_list, only: [:show, :update, :destroy]
  before_action :admin_athenticate, :authenticate_api_v1_user!

  # GET /api/v1/to_buy_lists
  def index
    to_buy_lists = ToBuyList.all
    if to_buy_lists
      render json: {status: "SUCCESS", message: "Fetched all the to_buy_lists successfully", data: to_buy_lists}, status: :ok
    else
      render json: to_buy_lists.errors, status: :bad_request
    end
  end

  # GET /api/v1/to_buy_lists/1
  def show
    to_buy_list = ToBuyList.find(params[:id])
    render json: to_buy_list
  end

  # POST /api/v1/to_buy_lists
  def create
    to_buy_list = ToBuyList.new(to_buy_list_params)
    if to_buy_list.save
      render json: to_buy_list, status: :created, location: api_v1_to_buy_list_url(to_buy_list)
    else
      render json: to_buy_list.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/to_buy_lists/1
  def update
    to_buy_list = ToBuyList.find(params[:id])

    if to_buy_list.update(to_buy_list_params)
      render json: to_buy_list
    else
      render json: to_buy_list.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/to_buy_lists/1
  def destroy
    to_buy_list = ToBuyList.find(params[:id])
    to_buy_list.destroy

    render json: { message: 'ToBuyList successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_buy_list
      to_buy_list = ToBuyList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def to_buy_list_params
      params.require(:to_buy_list).permit(:group_id, :item_id, :buy_flag, :discarded_at)
    end
end
