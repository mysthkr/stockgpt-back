require "test_helper"

class Api::V1::GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_group = api_v1_groups(:one)
  end

  test "should get index" do
    get api_v1_groups_url, as: :json
    assert_response :success
  end

  test "should create api_v1_group" do
    assert_difference('Api::V1::Group.count') do
      post api_v1_groups_url, params: { api_v1_group: { name: @api_v1_group.name } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_group" do
    get api_v1_group_url(@api_v1_group), as: :json
    assert_response :success
  end

  test "should update api_v1_group" do
    patch api_v1_group_url(@api_v1_group), params: { api_v1_group: { name: @api_v1_group.name } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_group" do
    assert_difference('Api::V1::Group.count', -1) do
      delete api_v1_group_url(@api_v1_group), as: :json
    end

    assert_response 204
  end
end
