require 'rails_helper'

RSpec.describe "Api::V1::Admin::Groups", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }

  describe "GET /index" do
    it "admin succes to get all groups" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_groups_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get all groups" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_groups_path, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 group" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_group_path(group.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get 2 group" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_group_path(group2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  ##########################################
  
  describe "POST /create" do
    it "admin succes to post group" do
      auth_tokens = sign_in(admin)
      params={
        group: {
          name: "test group posted"
        }
      }
      post api_v1_admin_groups_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end

    it "admin fail to post group" do
      auth_tokens = sign_in(admin)
      params={
        group: {
          aaa: "bad_request"
        }
      }
      post api_v1_admin_groups_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user fail to post group" do
      auth_tokens = sign_in(user2)
      params={
        group: {
          name: "test group posted"
        }
      }
      post api_v1_admin_groups_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "PATCH/PUT /update" do
    it "admin succes to update 1 group" do
      auth_tokens = sign_in(admin)
      params={
        group: {
          name: "test group posted"
        }
      }
      put api_v1_admin_group_path(group.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to update 2 group" do
      auth_tokens = sign_in(user2)
      params={
        group: {
          name: "test group posted"
        }
      }
      put api_v1_admin_group_path(group2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete 1 group" do
      auth_tokens = sign_in(admin)
      delete api_v1_admin_group_path(group2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to delete 2 group" do
      auth_tokens = sign_in(user2)
      delete api_v1_admin_group_path(group2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end
end
