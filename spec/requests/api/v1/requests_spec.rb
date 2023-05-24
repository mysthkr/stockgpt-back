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
end
