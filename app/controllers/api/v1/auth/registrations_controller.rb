class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  # before_action :create_group, only: [:create]
  
  private
  # def create_group
  #   redirect_to controller: api/v1/groups, action: :create
  # end

  def sign_up_params
    # require(:registration)を追加
    params.require(:registration).permit(:email, :group_id, :password, :admin, :business)
  end

  def account_update_params
    params.permit(:email, :group_id, :password)
  end
end
