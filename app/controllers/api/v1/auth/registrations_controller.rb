class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    # require(:registration)を追加
    params.require(:registration).permit(:email, :group_id, :password, :admin, :business)
  end

  def account_update_params
    params.permit(:email, :group_id, :password)
  end
end
