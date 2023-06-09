class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:show, :update, :destroy]
  before_action :current_user_eq_target, only: [:show, :update, :destroy]
  skip_after_action :update_auth_header, only: [:destroy]

  # GET /api/v1/user/1
  def show
    user = User.find(current_api_v1_user.id)
    render json: user
  end

  # PATCH/PUT /api/v1/users/1
  def update
    user = User.find(current_api_v1_user.id)

    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/users/1
  def change_group
    # user = User.find(current_api_v1_user.id)
    user = User.where(group_id: current_api_v1_user.group_id, id: params[:user_id])
    new_group = Group.new(name: "デフォルトグループ名")
    if new_group.save
      if user.update(group_id: new_group.id)
        render json: user
      else
        render json: user.errors, status: :bad_request
      end
    else
      render json: new_group.errors, status: :bad_request
    end
  end

  def approve_group
    invitation = Invitation.find(params[:invitation_id])
    user = User.where(group_id: current_api_v1_user.group_id, id: invitation.user_id)
    if user.update(group_id: invitation.group_id)
      render json: user
      invitation.destroy
    else
      render json: user.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    user = User.find(current_api_v1_user.id)
    user.destroy
    render json: { message: 'User successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :group_id, :encrypted_password, :admin, :business)
    end

    def current_user_eq_target
      head :unauthorized unless current_api_v1_user.id == params[:id].to_i
    end
end

