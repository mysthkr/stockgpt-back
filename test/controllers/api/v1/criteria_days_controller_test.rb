require "test_helper"

class Api::V1::CriteriaDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_criteria_day = api_v1_criteria_days(:one)
  end

  test "should get index" do
    get api_v1_criteria_days_url, as: :json
    assert_response :success
  end

  test "should create api_v1_criteria_day" do
    assert_difference('Api::V1::CriteriaDay.count') do
      post api_v1_criteria_days_url, params: { api_v1_criteria_day: { criteria: @api_v1_criteria_day.criteria, group_id: @api_v1_criteria_day.group_id, item_id: @api_v1_criteria_day.item_id } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_criteria_day" do
    get api_v1_criteria_day_url(@api_v1_criteria_day), as: :json
    assert_response :success
  end

  test "should update api_v1_criteria_day" do
    patch api_v1_criteria_day_url(@api_v1_criteria_day), params: { api_v1_criteria_day: { criteria: @api_v1_criteria_day.criteria, group_id: @api_v1_criteria_day.group_id, item_id: @api_v1_criteria_day.item_id } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_criteria_day" do
    assert_difference('Api::V1::CriteriaDay.count', -1) do
      delete api_v1_criteria_day_url(@api_v1_criteria_day), as: :json
    end

    assert_response 204
  end
end
