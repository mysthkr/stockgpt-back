require 'rails_helper'

RSpec.describe "Api::V1::Admin::CriteriaDays", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:item){ FactoryBot.create(:item) }
  let!(:item2){ FactoryBot.create(:item2) }
  let!(:item3){ FactoryBot.create(:item3) }

  let!(:criteria_day){ FactoryBot.create(:criteria_day, item_id: item.id, group_id: group.id) }
  let!(:criteria_day2){ FactoryBot.create(:criteria_day2, item_id: item2.id, group_id: group2.id) }
  let!(:criteria_day3){ FactoryBot.create(:criteria_day3, item_id: item3.id, group_id: group3.id) }

  describe "GET /index" do
    it "admin succes to get all criteria_days" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_criteria_days_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get all criteria_days" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_criteria_days_path, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 criteria_day" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_criteria_day_path(criteria_day.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get 2 criteria_day" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_criteria_day_path(criteria_day2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  ##########################################
  
  describe "POST /create" do
    it "admin succes to post criteria_day" do
      auth_tokens = sign_in(admin)
      params={
        criteria_day: {
          group_id: group3.id,
          item_id: item3.id,
          criteria: 500
        }
      }
      post api_v1_admin_criteria_days_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end

    it "admin fail to post criteria_day" do
      auth_tokens = sign_in(admin)
      params={
        criteria_day: {
          aaa: "bad_request"
        }
      }
      post api_v1_admin_criteria_days_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user fail to post criteria_day" do
      auth_tokens = sign_in(user2)
      params={
        criteria_day: {
          group_id: group3.id,
          item_id: item3.id,
          criteria: 500
        }
      }
      post api_v1_admin_criteria_days_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "PATCH/PUT /update" do
    it "admin succes to update 1 criteria_day" do
      auth_tokens = sign_in(admin)
      params={
        criteria_day: {
          criteria: 777
        }
      }
      put api_v1_admin_criteria_day_path(criteria_day.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to update 2 criteria_day" do
      auth_tokens = sign_in(user2)
      params={
        criteria_day: {
          group_id: group.id,
          criteria: 7777
        }
      }
      put api_v1_admin_criteria_day_path(criteria_day2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete 1 criteria_day" do
      auth_tokens = sign_in(admin)
      delete api_v1_admin_criteria_day_path(criteria_day.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to delete 2 criteria_day" do
      auth_tokens = sign_in(user2)
      delete api_v1_admin_criteria_day_path(criteria_day2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end
end
