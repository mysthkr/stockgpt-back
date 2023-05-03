require "test_helper"

class Api::V1::CategoryGroceriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_category_grocery = api_v1_category_groceries(:one)
  end

  test "should get index" do
    get api_v1_category_groceries_url, as: :json
    assert_response :success
  end

  test "should create api_v1_category_grocery" do
    assert_difference('Api::V1::CategoryGrocery.count') do
      post api_v1_category_groceries_url, params: { api_v1_category_grocery: { name: @api_v1_category_grocery.name } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_category_grocery" do
    get api_v1_category_grocery_url(@api_v1_category_grocery), as: :json
    assert_response :success
  end

  test "should update api_v1_category_grocery" do
    patch api_v1_category_grocery_url(@api_v1_category_grocery), params: { api_v1_category_grocery: { name: @api_v1_category_grocery.name } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_category_grocery" do
    assert_difference('Api::V1::CategoryGrocery.count', -1) do
      delete api_v1_category_grocery_url(@api_v1_category_grocery), as: :json
    end

    assert_response 204
  end
end
