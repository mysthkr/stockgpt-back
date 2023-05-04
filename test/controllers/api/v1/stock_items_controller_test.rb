require "test_helper"

class Api::V1::StockItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_stock_item = api_v1_stock_items(:one)
  end

  test "should get index" do
    get api_v1_stock_items_url, as: :json
    assert_response :success
  end

  test "should create api_v1_stock_item" do
    assert_difference('Api::V1::StockItem.count') do
      post api_v1_stock_items_url, params: { api_v1_stock_item: { alarm_date: @api_v1_stock_item.alarm_date, criteria: @api_v1_stock_item.criteria, descarded_at: @api_v1_stock_item.descarded_at, group_id: @api_v1_stock_item.group_id, item_id: @api_v1_stock_item.item_id, price: @api_v1_stock_item.price, quality: @api_v1_stock_item.quality, shop_id: @api_v1_stock_item.shop_id } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_stock_item" do
    get api_v1_stock_item_url(@api_v1_stock_item), as: :json
    assert_response :success
  end

  test "should update api_v1_stock_item" do
    patch api_v1_stock_item_url(@api_v1_stock_item), params: { api_v1_stock_item: { alarm_date: @api_v1_stock_item.alarm_date, criteria: @api_v1_stock_item.criteria, descarded_at: @api_v1_stock_item.descarded_at, group_id: @api_v1_stock_item.group_id, item_id: @api_v1_stock_item.item_id, price: @api_v1_stock_item.price, quality: @api_v1_stock_item.quality, shop_id: @api_v1_stock_item.shop_id } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_stock_item" do
    assert_difference('Api::V1::StockItem.count', -1) do
      delete api_v1_stock_item_url(@api_v1_stock_item), as: :json
    end

    assert_response 204
  end
end
