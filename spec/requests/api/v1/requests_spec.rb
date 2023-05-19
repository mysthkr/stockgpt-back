require 'rails_helper'

RSpec.describe "Api::V1::Requests", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:request){ FactoryBot.create(:request, user_id: admin.id) }
  let!(:request2){ FactoryBot.create(:request2, user_id: user2.id) }
  let!(:request3){ FactoryBot.create(:request3, user_id: user3.id) }

  describe "GET /index" do
    it "admin succes to get all requests" do
      auth_tokens = sign_in(admin)
      get api_v1_requests_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get all requests" do
      auth_tokens = sign_in(user2)
      get api_v1_requests_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 request" do
      auth_tokens = sign_in(admin)
      get api_v1_requests_path(request.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get 2 request" do
      auth_tokens = sign_in(user2)
      get api_v1_requests_path(request2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  ##########################################
  
  describe "POST /create" do
    it "admin succes to post request" do
      auth_tokens = sign_in(admin)
      params={
        request: {
          user_id: user3.id,
          request_type: 1,
          request_name: "test request",
          register_flag: true
        }
      }
      post api_v1_requests_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end

    it "admin fail to post request" do
      auth_tokens = sign_in(admin)
      params={
        request: {
          aaa: "bad_request"
        }
      }
      post api_v1_requests_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user succes to post request" do
      auth_tokens = sign_in(user2)
      params={
        request: {
          user_id: user3.id,
          request_type: 2,
          request_name: "test request 222"
        }
      }
      post api_v1_requests_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end
  end

  describe "PATCH/PUT /update" do
    it "admin succes to update 1 request" do
      auth_tokens = sign_in(admin)
      params={
        request: {
          user_id: user2.id,
          request_type: 222,
          request_name: "update test request"
        }
      }
      put api_v1_request_path(request.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to update 2 request" do
      auth_tokens = sign_in(user2)
      params={
        request: {
          request_type: 222,
          request_name: "update test request",
          register_flag: true
        }
      }
      put api_v1_request_path(request2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete 1 request" do
      auth_tokens = sign_in(admin)
      delete api_v1_request_path(request.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to delete 2 request" do
      auth_tokens = sign_in(user2)
      delete api_v1_request_path(request2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end
end
