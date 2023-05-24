require 'rails_helper'

RSpec.describe "Api::V1::Admin::Makers", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:maker){ FactoryBot.create(:maker) }
  let!(:maker2){ FactoryBot.create(:maker2) }
  let!(:maker3){ FactoryBot.create(:maker3) }

  describe "GET /index" do
    it "admin succes to get all makers" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_makers_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get all makers" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_makers_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 maker" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_makers_path(maker.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get 2 maker" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_makers_path(maker2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  ##########################################
  
  describe "POST /create" do
    it "admin succes to post maker" do
      auth_tokens = sign_in(admin)
      params={
        maker: {
        name: "test maker posted"
        }
      }
      post api_v1_admin_makers_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end

    it "admin fail to post maker" do
      auth_tokens = sign_in(admin)
      params={
        maker: {
          aaa: "bad_request"
        }
      }
      post api_v1_admin_makers_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user succes to post maker" do
      auth_tokens = sign_in(user2)
      params={
        maker: {
        name: "test maker posted"
        }
      }
      post api_v1_admin_makers_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end
  end

  describe "PATCH/PUT /update" do
    it "admin succes to update 1 maker" do
      auth_tokens = sign_in(admin)
      params={
        maker: {
        name: "test maker updated"
        }
      }
      put api_v1_admin_maker_path(maker.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to update 2 maker" do
      auth_tokens = sign_in(user2)
      params={
        maker: {
        name: "test maker updated"
        }
      }
      put api_v1_admin_maker_path(maker2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete 1 maker" do
      auth_tokens = sign_in(admin)
      delete api_v1_admin_maker_path(maker.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to delete 2 maker" do
      auth_tokens = sign_in(user2)
      delete api_v1_admin_maker_path(maker2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end
end
