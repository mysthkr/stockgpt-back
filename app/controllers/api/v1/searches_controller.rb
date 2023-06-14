class Api::V1::SearchesController < ApplicationController
    # before_action :authenticate_api_v1_user! , only: [:create]
  
    # # GET /api/v1/shops
    # def index
    #   shops = Shop.all
    #   if shops
    #     render json: {status: "SUCCESS", message: "Fetched all the shops successfully", data: shops}, status: :ok
    #   else
    #     render json: shops.errors, status: :bad_request
    #   end
    # end
  
    # POST /api/v1/
    def create
      params ||= JSON.parse(request.body.read, {:symbolize_names => true})

      if params[:headers][:product_flag]
        search = Product.search_product_word(params[:data])
        pp search
        pp "search.as_json"
        pp render json: search.as_json
        render json: search.as_json, status: :ok

      else
        search = Grocery.search_word(params[:data])
        pp search
        render json: search.as_json, status: :ok
      end

    end

    private

    def profile_params
      params.require(:search).permit(:data)
    end
  end