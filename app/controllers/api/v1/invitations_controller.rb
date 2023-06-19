class Api::V1::InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:show, :create, :update, :destroy]
  # before_action -> { ensure_user_index("invitations") }, only: [:index]
  before_action -> { ensure_user_params_id("invitations") }, only: [:show, :destroy]
  before_action :set_group_id, only: [:create, :update, :destroy]

  # GET /api/v1/invitations/1
  def index
    invitation = Invitation.joins(:group).where(user_id: current_api_v1_user.id)
    .select('invitations.*, groups.name as group_name')
    puts "invitationsssssssss"
    pp invitation
    render json: invitation
  end

  # GET /api/v1/invitations/1
  def show
    invitation = Invitation.where(id: params[:id], group_id: current_api_v1_user.group_id)
    render json: invitation
  end

  # POST /api/v1/invitations
  def create
    email = params[:email]
    group_id = params[:group_id]
    inviting_user_id = params[:user_id]
    invited_user = User.where(email: email).first
    pp invited_user
    invitation = Invitation.new(group_id: group_id, user_id: invited_user.id)
    pp invitation
    if invitation.save
      render json: invitation, status: :created, location: api_v1_invitation_url(invitation)
    else
      render json: invitation.errors, status: :bad_request
    end
  end

  # # PATCH/PUT /api/v1/invitations/1
  # def update
  #   invitation = Invitation.where(id: params[:id], group_id: current_api_v1_user.group_id)

  #   if invitation.update(invitation_params)
  #     render json: invitation
  #   else
  #     render json: invitation.errors, status: :bad_request
  #   end
  # end

  # DELETE /api/v1/invitations/1
  def destroy
    invitation = Invitation.find(params[:id])
    invitation.destroy

    render json: { message: 'Invitation successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      invitation = Invitation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invitation_params
      params.require(:invitation).permit(:group_id, :user_id)
    end

    def set_group_id
      params[:invitation][:group_id] = current_api_v1_user.group_id
    end
    
end
