require 'rails_helper'

RSpec.describe "Api::V1::Admin::CategoryGroceries", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:category_grocery){ FactoryBot.create(:category_grocery) }
  let!(:category_grocery2){ FactoryBot.create(:category_grocery2) }
  let!(:category_grocery3){ FactoryBot.create(:category_grocery3) }

  describe "GET /index" do
    it "admin succes to get all category_groceries" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_category_groceries_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get all category_groceries" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_category_groceries_path, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 category_grocery" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_category_grocery_path(category_grocery.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get 2 category_grocery" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_category_grocery_path(category_grocery2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  ##########################################
  
  describe "POST /create" do
    it "admin succes to post category_grocery" do
      auth_tokens = sign_in(admin)
      params={
        category_grocery: {
        name: "test category_grocery posted"
        }
      }
      post api_v1_admin_category_groceries_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end

    it "admin fail to post category_grocery" do
      auth_tokens = sign_in(admin)
      params={
        category_grocery: {
        aaa: "bad_request"
        }
      }
      post api_v1_admin_category_groceries_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user fail to post category_grocery" do
      auth_tokens = sign_in(user2)
      params={
        category_grocery: {
          name: "test category_grocery posted"
        }
      }
      post api_v1_admin_category_groceries_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "PATCH/PUT /update" do
    it "admin succes to update 1 category_grocery" do
      auth_tokens = sign_in(admin)
      params={
        category_grocery: {
        name: "test category_grocery posted"
        }
      }
      put api_v1_admin_category_grocery_path(category_grocery.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to update 2 category_grocery" do
      auth_tokens = sign_in(user2)
      params={
        category_grocery: {
        name: "test category_grocery posted"
        }
      }
      put api_v1_admin_category_grocery_path(category_grocery2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete 1 category_grocery" do
      auth_tokens = sign_in(admin)
      delete api_v1_admin_category_grocery_path(category_grocery.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to delete 2 category_grocery" do
      auth_tokens = sign_in(user2)
      delete api_v1_admin_category_grocery_path(category_grocery2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end
end
