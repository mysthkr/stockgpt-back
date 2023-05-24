class Api::V1::ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:index, :show, :create, :update, :destroy]

  # GET /api/v1/profiles
  def index
    profiles = Profile.all

    if profiles
      render json: {status: "SUCCESS", message: "Fetched all the profiles successfully", data: profiles}, status: :ok
    else
      render json: profiles.errors, status: :bad_request
    end
  end

  # GET /api/v1/profiles/1
  def show
    profile = Profile.find(params[:id])
    render json: profile
  end

  # POST /api/v1/profiles
  def create
    profile = Profile.new(profile_params)
    if profile.save
      render json: profile, status: :created, location: api_v1_profile_url(profile)
    else
      render json: profile.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/profiles/1
  def update
    profile = Profile.find(params[:id])

    if profile.update(profile_params)
      render json: profile
    else
      render json: profile.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/profiles/1
  def destroy
    profile = Profile.find(params[:id])
    profile.destroy

    render json: { message: 'Profile successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:profile_id, :name, :nickname, :roommate_number, :prefecture, :user_id)
    end
end
