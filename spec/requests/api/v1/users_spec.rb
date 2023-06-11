require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  describe "GET /show" do
    it "admin succes to get ownself" do
      auth_tokens = sign_in(admin)
      get api_v1_user_path(admin.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get own user" do
      auth_tokens = sign_in(user2)
      get api_v1_user_path(user2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get another user" do
      auth_tokens = sign_in(user2)
      get api_v1_user_path(user3.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "PATCH/PUT /update" do
    it "ユーザーは自ユーザー情報を更新出来る" do
      auth_tokens = sign_in(admin)
      params={
          user: {
          name: "更新した",
          email: "user@example.com",
          password: "password"
        }
      }
      put api_v1_user_path(admin.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "ユーザーは他ユーザー情報を更新出来ない" do
      auth_tokens = sign_in(user2)
      params={
        user: {
        name: "更新した",
        email: "user@example.com",
        password: "password"
      }
    }
      put api_v1_user_path(user3.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "DELETE /api/v1/user/:id" do
    it "ユーザーは自ユーザー情報を削除出来る" do
      auth_tokens = sign_in(user2)
      delete api_v1_user_path(user2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "ユーザーは他ユーザー情報を削除出来ない" do
      auth_tokens = sign_in(user2)
      delete api_v1_user_path(user3.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end
end