require "test_helper"

class Api::V1::ToBuyListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_to_buy_list = api_v1_to_buy_lists(:one)
  end

  test "should get index" do
    get api_v1_to_buy_lists_url, as: :json
    assert_response :success
  end

  test "should create api_v1_to_buy_list" do
    assert_difference('Api::V1::ToBuyList.count') do
      post api_v1_to_buy_lists_url, params: { api_v1_to_buy_list: { buy_flag: @api_v1_to_buy_list.buy_flag, discarded_at: @api_v1_to_buy_list.discarded_at, group_id: @api_v1_to_buy_list.group_id, item_id: @api_v1_to_buy_list.item_id } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_to_buy_list" do
    get api_v1_to_buy_list_url(@api_v1_to_buy_list), as: :json
    assert_response :success
  end

  test "should update api_v1_to_buy_list" do
    patch api_v1_to_buy_list_url(@api_v1_to_buy_list), params: { api_v1_to_buy_list: { buy_flag: @api_v1_to_buy_list.buy_flag, discarded_at: @api_v1_to_buy_list.discarded_at, group_id: @api_v1_to_buy_list.group_id, item_id: @api_v1_to_buy_list.item_id } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_to_buy_list" do
    assert_difference('Api::V1::ToBuyList.count', -1) do
      delete api_v1_to_buy_list_url(@api_v1_to_buy_list), as: :json
    end

    assert_response 204
  end
end
