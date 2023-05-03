class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /api/v1/users
  def index
    users = User.all
    if users
      render json: {status: "SUCCESS", message: "Fetched all the users successfully", data: users}, status: :ok
    else
      render json: users.errors, status: :bad_request
    end
  end

  # GET /api/v1/users/1
  def show
    user = User.find(params[:id])
    render json: user
  end

  # POST /api/v1/users
  def create
    user = User.new(user_params)

    puts user

    if user.save
      render json: user, status: :created, location: api_v1_user_url(user)
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    @user.destroy
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
end
