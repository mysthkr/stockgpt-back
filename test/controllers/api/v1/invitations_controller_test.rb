require "test_helper"

class Api::V1::InvitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_invitation = api_v1_invitations(:one)
  end

  test "should get index" do
    get api_v1_invitations_url, as: :json
    assert_response :success
  end

  test "should create api_v1_invitation" do
    assert_difference('Api::V1::Invitation.count') do
      post api_v1_invitations_url, params: { api_v1_invitation: { group_id: @api_v1_invitation.group_id, user_id: @api_v1_invitation.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_invitation" do
    get api_v1_invitation_url(@api_v1_invitation), as: :json
    assert_response :success
  end

  test "should update api_v1_invitation" do
    patch api_v1_invitation_url(@api_v1_invitation), params: { api_v1_invitation: { group_id: @api_v1_invitation.group_id, user_id: @api_v1_invitation.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_invitation" do
    assert_difference('Api::V1::Invitation.count', -1) do
      delete api_v1_invitation_url(@api_v1_invitation), as: :json
    end

    assert_response 204
  end
end
