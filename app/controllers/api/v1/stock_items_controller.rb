class Api::V1::StockItemsController < ApplicationController
  before_action :set_stock_item, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user! , only: [:index, :show, :create, :update, :destroy, :alarms]
  before_action -> { ensure_user_index("stock_items") }, only: [:index]
  before_action -> { ensure_user_params_id("stock_items") }, only: [:show, :update, :destroy]
  before_action :set_group_id, only: [:create, :update, :destroy, :alarms]
  require "date"

  # GET /api/v1/stock_items
  def index
    stock_items = StockItem.joins(:item)
      .left_outer_joins(item: [{ product: [:category_product, :sub_category_product] },
      { grocery: [:category_grocery, :sub_category_grocery] }])
      .where(group_id: current_api_v1_user.group_id)
      .select('stock_items.*, items.name as item_name, products.picture as product_picture,
              category_products.name as category_product_name, 
              sub_category_products.name as sub_category_product_name, 
              category_groceries.name as category_grocery_name, 
              sub_category_groceries.name as sub_category_grocery_name')
      .distinct('stock_items.id')
    pp stock_items
    if stock_items
      render json: {status: "SUCCESS", message: "Fetched all the stock_items successfully", data: stock_items}, status: :ok
    else
      render json: stock_items.errors, status: :bad_request
    end
  end

  # GET /api/v1/stock_items/alarm
  def alarms
    stock_items = StockItem.where(group_id: current_api_v1_user.group_id, alarm_date: ..Date.today)
    if stock_items
      render json: {status: "SUCCESS", message: "Fetched all the stock_items successfully", data: stock_items}, status: :ok
    else
      render json: stock_items.errors, status: :bad_request
    end
  end

  # GET /api/v1/stock_items/recipe
  require "openai"
  require 'dotenv'
  Dotenv.load('.env')

  # puts ENV['OPENAI_API_KEY']
  def recipes


    stock_items = StockItem.joins(:item, item: :grocery)
    .where(group_id: current_api_v1_user.group_id, alarm_date: ..Date.today)
    .select('stock_items.*, items.name as item_name')



    if stock_items
      puts "stock_items"
      pp "食材: #{stock_items.map{|i| i.item_name}.join(", ")}"
    
      # OpenAI.api_key = ENV['OPENAI_API_KEY']
      client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
      res = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [
            {role: "system", content: "あなたは日本家庭で育った料理人です。"},
            {role: "system", content: "日本の様々な料理に精通していますが、得意なのは一般家庭ででるような各国の料理です。"},
            {role: "system", content: "あなたはよくオススメの料理レシピを聞かれます。
              聞かれた場合は、日本の一般家庭にあるような食材や調味料を使ったレシピを教えます。"},
            {role: "system", content: "さらに、特定の複数の食材を与えられて、
              その食材を扱ったレシピを聞かれることがあります。
              その場合には、出来るだけ与えられた食材を消費するような美味しい料理のレシピを考案します。"},
            {role: "system", content: "あなたが利用されるシステムからは、食材の情報しか与えられないため、
              ユーザーは細かくあなたに依頼ができないシチュエーションです。"},
            {role: "system", content: "可能であれば、健康を意識したり、はたまた旬の食材を扱ったレシピも考案します。"},
            {role: "system", content: "提案する料理は日本の料理だけでなく、日本人が好きそうな全世界の料理のレシピです。"},
            {role: "system", content: "提案するレシピは基本1つ、食材が多い場合には2つまで提案してください"},
            {role: "system", content: "２つレシピを提案する場合は、可能であればジャンルが違うものを提案してください。"},
            {role: "user", content: "これらの食材を出来るだけ使った、美味しい料理のレシピを分かりやすく日本語で教えてください。"},
            {role: "user", content: "食材: #{stock_items.map{|i| i.item_name}.join(", ")}"},
          ],
        },
      )
      text = res["choices"][0]["message"]["content"]
      render json: { recipe: text }, status: :ok
    else
      render json: stock_items.errors, status: :bad_request
    end
  end

  



  # GET /api/v1/stock_items/1
  def show
    stock_item = StockItem.where(id: params[:id], group_id: current_api_v1_user.group_id)
    render json: stock_item
  end

  # POST /api/v1/stock_items
  def create
    stock_item = StockItem.new(stock_item_params)
    puts "stock_item yeaaaaaa"
    puts stock_item_params
    puts stock_item
    if stock_item.save
      render json: stock_item, status: :created, location: api_v1_stock_item_url(stock_item)
    else
      render json: stock_item.errors, status: :bad_request
    end
  end

  # PATCH/PUT /api/v1/stock_items/1
  def update
    stock_item = StockItem.where(id: params[:id], group_id: current_api_v1_user.group_id)

    if stock_item.update(stock_item_params)
      render json: stock_item
    else
      render json: stock_item.errors, status: :bad_request
    end
  end

  # DELETE /api/v1/stock_items/1
  def destroy
    stock_item = StockItem.where(id: params[:id], group_id: current_api_v1_user.group_id)
    stock_item.first.destroy

    render json: { message: 'StockItem successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_item
      stock_item = StockItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_item_params
      params.require(:stock_item).permit(:group_id, :criteria, :item_id, :alarm_date, :price, :shop_id, :quantity, :discarded_at)
    end

    def set_group_id
      params[:stock_item][:group_id] = current_api_v1_user.group_id
    end
end
