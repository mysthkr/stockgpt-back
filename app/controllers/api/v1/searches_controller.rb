class Api::V1::SearchesController < ApplicationController
    # before_action :authenticate_api_v1_user! , only: [:index, :show]
  
    # GET /api/v1/shops
    def index
      shops = Shop.all
      if shops
        render json: {status: "SUCCESS", message: "Fetched all the shops successfully", data: shops}, status: :ok
      else
        render json: shops.errors, status: :bad_request
      end
    end
  
    # POST /api/v1/shops/1
    def create
      params ||= JSON.parse(request.body.read, {:symbolize_names => true})
      puts "params:"
      puts params
      search = Grocery.search_word(params[:data])
      puts search
      # if invitation.save
      #   render json: search, status: :created, location: api_v1_invitation_url(invitation)
      # else
      #   render json: invitation.errors, status: :bad_request
      # end
    end

    private

    def profile_params
      params.require(:search).permit(:data)
    end
  end