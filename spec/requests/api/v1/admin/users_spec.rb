require 'rails_helper'

RSpec.describe "Api::V1::Admin::Users", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  describe "GET /api/v1/admin/users" do
    it "admig success to get all users" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_users_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get all users" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_users_path, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "GET /api/v1/admin/user/:id" do
    it "admin success to get a user" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_user_path(user2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get a user" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_user_path(user2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "POST /create" do
    # it "admin success to create a new user" do
    #   auth_tokens = sign_in(admin)
    #   params={
    #     user: {
    #       group_id: group3.id.to_i,
    #       email: "admin2@example.com",
    #       encrypted_password: "password",
    #     }
    #   }
    #   # binding.irb
    #   post api_v1_admin_users_path, params: params, headers: auth_tokens
    #   expect(response).to have_http_status :ok
    # end

    it "user fail to create a new user" do
      auth_tokens = sign_in(user2)
      params={
        user: {
          email: "user@example.com",
          password: "password"
        }
      }
      post api_v1_admin_users_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "PATCH/PUT /update" do
    it "admin success to edit another user" do
      auth_tokens = sign_in(admin)
      params={
          user: {
            email: "user@example.com",
            password: "password"
          }
        }
      put api_v1_admin_user_path(user2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to edit a user" do
      auth_tokens = sign_in(user2)
      params={
        user: {
          name: "更新した",
          email: "user@example.com",
          password: "password"
        }
      }
      put api_v1_admin_user_path(user2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "DELETE /api/v1/admin/users/:id" do
    it "admin success to delete another user" do
      auth_tokens = sign_in(admin)
      delete api_v1_admin_user_path(user2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to delete a user" do
      auth_tokens = sign_in(user2)
      delete api_v1_admin_user_path(user2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end
end
