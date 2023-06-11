class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def admin_athenticate
    unless current_api_v1_user.admin == true
      head :unauthorized
    end
  end

  # def ensure_user
  #   carts = current_api_v1_user.group.carts
  #   cart = carts.find_by(id: params[:id])
  #   head :unauthorized unless cart
  # end
  def ensure_user_index(model)
    group_models = current_api_v1_user.group.send(model)
    head :unauthorized unless group_models
  end

  def ensure_user_params_id(model)
    group_models = current_api_v1_user.group.send(model)
    model = group_models.find_by(id: params[:id])
    head :unauthorized unless model
  end
end
