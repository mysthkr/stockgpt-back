class Api::V1::CriteriaDaysController < ApplicationController
  before_action :set_criteria_day, only: [:show, :update, :destroy]

  # GET /api/v1/criteria_days
  def index
    def index
      criteria_days = CriteriaDay.all
      if criteria_days
        render json: {status: "SUCCESS", message: "Fetched all the criteria_days successfully", data: criteria_days}, status: :ok
      else
        render json: criteria_days.errors, status: :bad_request
      end
    end
  end

  # GET /api/v1/criteria_days/1
  def show
    criteria_day = CriteriaDay.find(params[:id])
    render json: criteria_day
  end

  # POST /api/v1/criteria_days
  def create
    criteria_day = CriteriaDay.new(criteria_day_params)
    if criteria_day.save
      render json: criteria_day, status: :created, location: api_v1_criteria_day_url(criteria_day)
    else
      render json: criteria_day.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/criteria_days/1
  def update
    criteria_day = CriteriaDay.find(params[:id])

    if criteria_day.update(criteria_day_params)
      render json: criteria_day
    else
      render json: criteria_day.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/criteria_days/1
  def destroy
    criteria_day = CriteriaDay.find(params[:id])
    criteria_day.destroy

    render json: { message: 'CriteriaDay successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criteria_day
      criteria_day = CriteriaDay.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def criteria_day_params
      params.require(:criteria_day).permit(:group_id, :item_id, :criteria)
    end
end
