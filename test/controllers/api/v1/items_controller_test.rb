require "test_helper"

class Api::V1::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_item = api_v1_items(:one)
  end

  test "should get index" do
    get api_v1_items_url, as: :json
    assert_response :success
  end

  test "should create api_v1_item" do
    assert_difference('Api::V1::Item.count') do
      post api_v1_items_url, params: { api_v1_item: { criteria: @api_v1_item.criteria, name: @api_v1_item.name } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_item" do
    get api_v1_item_url(@api_v1_item), as: :json
    assert_response :success
  end

  test "should update api_v1_item" do
    patch api_v1_item_url(@api_v1_item), params: { api_v1_item: { criteria: @api_v1_item.criteria, name: @api_v1_item.name } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_item" do
    assert_difference('Api::V1::Item.count', -1) do
      delete api_v1_item_url(@api_v1_item), as: :json
    end

    assert_response 204
  end
end
