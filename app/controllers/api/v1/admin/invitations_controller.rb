class Api::V1::Admin::InvitationsController < ApplicationController
  before_action :admin_athenticate, :authenticate_api_v1_user!
  
  # GET /api/v1/invitations
  def index
    invitations = Invitation.all
    if invitations
      render json: {status: "SUCCESS", message: "Fetched all the invitations successfully", data: invitations}, status: :ok
    else
      render json: invitations.errors, status: :bad_request
    end
  end

  # GET /api/v1/invitations/1
  def show
    invitation = Invitation.find(params[:id])
    render json: invitation
  end

  # POST /api/v1/invitations
  def create
    invitation = Invitation.new(invitation_params)
    if invitation.save
      render json: invitation, status: :created, location: api_v1_invitation_url(invitation)
    else
      render json: invitation.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/invitations/1
  def update
    invitation = Invitation.find(params[:id])

    if invitation.update(invitation_params)
      render json: invitation
    else
      render json: invitation.errors, status: :bad_request
    end
  end

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
end
