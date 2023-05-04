require "test_helper"

class Api::V1::MakersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_maker = api_v1_makers(:one)
  end

  test "should get index" do
    get api_v1_makers_url, as: :json
    assert_response :success
  end

  test "should create api_v1_maker" do
    assert_difference('Api::V1::Maker.count') do
      post api_v1_makers_url, params: { api_v1_maker: { name: @api_v1_maker.name } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_maker" do
    get api_v1_maker_url(@api_v1_maker), as: :json
    assert_response :success
  end

  test "should update api_v1_maker" do
    patch api_v1_maker_url(@api_v1_maker), params: { api_v1_maker: { name: @api_v1_maker.name } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_maker" do
    assert_difference('Api::V1::Maker.count', -1) do
      delete api_v1_maker_url(@api_v1_maker), as: :json
    end

    assert_response 204
  end
end
