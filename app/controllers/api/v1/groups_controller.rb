class Api::V1::GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:show, :update, :destroy]
  before_action :current_user_eq_profile, only: [:show, :update, :destroy]
  before_action :set_group_id, only: [:update, :destroy]

  # # GET /api/v1/groups
  # def index
  #   groups = Group.where(id: params[:id], group_id: current_api_v1_user.group_id)
  #   if groups
  #     render json: {status: "SUCCESS", message: "Fetched all the groups successfully", data: groups}, status: :ok
  #   else
  #     render json: groups.errors, status: :bad_request
  #   end
  # end

  # GET /api/v1/groups/1
  def show
    group = Group.includes(users: :profile).find(current_api_v1_user.group_id)
    user_data = group.users.map { |user| { id: user.id, name: user.profile.name } }
    pp json: { group: group, user_data: user_data }
    render json: { group: group, user_data: user_data }
  end

  # POST /api/v1/groups
  def create
    group = Group.new(group_params)
    if group.save
      render json: group, status: :created, location: api_v1_group_url(group)
    else
      render json: group.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/groups/1
  def update
    group = Group.find(current_api_v1_user.group_id)

    if group.update(group_params)
      render json: group
    else
      render json: group.errors, status: :bad_request
    end
  end

  # # DELETE /api/v1/groups/1
  # def destroy
  #   group = Group.find(params[:id])
  #   binding.irb
  #   group.destroy

  #   render json: { message: 'Group successfully deleted.' }
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name)
    end

    def current_user_eq_profile
      head :unauthorized unless current_api_v1_user.group_id == params[:id].to_i
    end

    def set_group_id
      params[:group][:id] = current_api_v1_user.group_id
    end
end
