require "test_helper"

class Api::V1::ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_profile = api_v1_profiles(:one)
  end

  test "should get index" do
    get api_v1_profiles_url, as: :json
    assert_response :success
  end

  test "should create api_v1_profile" do
    assert_difference('Api::V1::Profile.count') do
      post api_v1_profiles_url, params: { api_v1_profile: { name: @api_v1_profile.name, nickname: @api_v1_profile.nickname, prefecture: @api_v1_profile.prefecture, roommate_number: @api_v1_profile.roommate_number, user_id: @api_v1_profile.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_profile" do
    get api_v1_profile_url(@api_v1_profile), as: :json
    assert_response :success
  end

  test "should update api_v1_profile" do
    patch api_v1_profile_url(@api_v1_profile), params: { api_v1_profile: { name: @api_v1_profile.name, nickname: @api_v1_profile.nickname, prefecture: @api_v1_profile.prefecture, roommate_number: @api_v1_profile.roommate_number, user_id: @api_v1_profile.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_profile" do
    assert_difference('Api::V1::Profile.count', -1) do
      delete api_v1_profile_url(@api_v1_profile), as: :json
    end

    assert_response 204
  end
end
