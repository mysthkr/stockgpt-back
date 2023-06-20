class Api::V1::ToBuyListsController < ApplicationController
  before_action :set_to_buy_list, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:index, :show, :create, :update, :destroy]
  before_action -> { ensure_user_index("to_buy_lists") }, only: [:index]
  before_action -> { ensure_user_params_id("to_buy_lists") }, only: [:show, :update, :destroy]
  before_action :set_group_id, only: [:create, :update, :destroy]

  # GET /api/v1/to_buy_lists
  def index
    to_buy_lists = ToBuyList.joins(:item).where(group_id: current_api_v1_user.group_id)
    .select('to_buy_lists.*, items.name as item_name, items.id as item_id')
    if to_buy_lists
      render json: {status: "SUCCESS", message: "Fetched all the to_buy_lists successfully", data: to_buy_lists}, status: :ok
    else
      render json: to_buy_lists.errors, status: :bad_request
    end
  end

  # GET /api/v1/to_buy_lists/1
  def show
    to_buy_list = ToBuyList.where(id: params[:id], group_id: current_api_v1_user.group_id)
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
    to_buy_list = ToBuyList.where(id: params[:id], group_id: current_api_v1_user.group_id)

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

    def set_group_id
      params[:to_buy_list][:group_id] = current_api_v1_user.group_id
    end
end
