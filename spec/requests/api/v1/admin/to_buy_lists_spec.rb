require 'rails_helper'

RSpec.describe "Api::V1::Admin::ToBuyLists", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:item){ FactoryBot.create(:item) }
  let!(:item2){ FactoryBot.create(:item2) }
  let!(:item3){ FactoryBot.create(:item3) }

  let!(:to_buy_list){ FactoryBot.create(:to_buy_list, item_id: item.id, group_id: group.id) }
  let!(:to_buy_list2){ FactoryBot.create(:to_buy_list2, item_id: item2.id, group_id: group2.id) }
  let!(:to_buy_list3){ FactoryBot.create(:to_buy_list3, item_id: item3.id, group_id: group3.id) }

  describe "GET /index" do
    it "admin succes to get all to_buy_lists" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_to_buy_lists_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get all to_buy_lists" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_to_buy_lists_path, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 to_buy_list" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_to_buy_lists_path(to_buy_list.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get 2 to_buy_list" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_to_buy_lists_path(to_buy_list2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  ##########################################
  
  describe "POST /create" do
    it "admin succes to post to_buy_list" do
      auth_tokens = sign_in(admin)
      params={
        to_buy_list: {
          group_id: group3.id,
          item_id: item3.id
        }
      }
      post api_v1_admin_to_buy_lists_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end

    it "admin fail to post to_buy_list" do
      auth_tokens = sign_in(admin)
      params={
        to_buy_list: {
          aaa: "bad_request"
        }
      }
      post api_v1_admin_to_buy_lists_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user fail to post to_buy_list" do
      auth_tokens = sign_in(user2)
      params={
        to_buy_list: {
          group_id: group3.id,
          item_id: item3.id,
          buy_flag: true
        }
      }
      post api_v1_admin_to_buy_lists_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "PATCH/PUT /update" do
    it "admin succes to update 1 to_buy_list" do
      auth_tokens = sign_in(admin)
      params={
        to_buy_list: {
          group_id: group3.id,
          item_id: item2.id,
          buy_flag: true
        }
      }
      put api_v1_admin_to_buy_list_path(to_buy_list.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to update 2 to_buy_list" do
      auth_tokens = sign_in(user2)
      params={
        to_buy_list: {
          buy_flag: true
        }
      }
      put api_v1_admin_to_buy_list_path(to_buy_list2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete 1 to_buy_list" do
      auth_tokens = sign_in(admin)
      delete api_v1_admin_to_buy_list_path(to_buy_list.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to delete 2 to_buy_list" do
      auth_tokens = sign_in(user2)
      delete api_v1_admin_to_buy_list_path(to_buy_list2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end
end
