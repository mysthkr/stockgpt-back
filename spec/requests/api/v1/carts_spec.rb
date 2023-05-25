require 'rails_helper'

RSpec.describe "Api::V1::Carts", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:item){ FactoryBot.create(:item) }
  let!(:item2){ FactoryBot.create(:item2) }
  let!(:item3){ FactoryBot.create(:item3) }

  let!(:cart){ FactoryBot.create(:cart, item_id: item.id, group_id: group.id) }
  let!(:cart2){ FactoryBot.create(:cart2, item_id: item2.id, group_id: group2.id) }
  let!(:cart3){ FactoryBot.create(:cart3, item_id: item3.id, group_id: group3.id) }

  describe "GET /index" do
    it "admin succes to get all carts" do
      auth_tokens = sign_in(admin)
      get api_v1_carts_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get all carts" do
      auth_tokens = sign_in(user2)
      get api_v1_carts_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 cart" do
      auth_tokens = sign_in(admin)
      get api_v1_cart_path(cart3.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get 2 cart" do
      auth_tokens = sign_in(user2)
      get api_v1_cart_path(cart.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get 2 cart" do
      auth_tokens = sign_in(user2)
      get api_v1_cart_path(cart2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  ##########################################
  
  describe "POST /create" do
    it "admin succes to post cart" do
      auth_tokens = sign_in(admin)
      params={
        cart: {
          group_id: group3.id,
          item_id: item3.id,
          criteria: 500
        }
      }
      post api_v1_carts_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end

    it "admin fail to post cart" do
      auth_tokens = sign_in(admin)
      params={
        cart: {
          aaa: "bad_request"
        }
      }
      post api_v1_carts_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user succes to post cart" do
      auth_tokens = sign_in(user2)
      params={
        cart: {
          group_id: group3.id,
          item_id: item3.id,
          criteria: 500
        }
      }
      post api_v1_carts_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end
  end

  describe "PATCH/PUT /update" do
    it "admin succes to update 3 cart" do
      auth_tokens = sign_in(admin)
      params={
        cart: {
          group_id: group3.id,
          item_id: item3.id,
          criteria: 777
        }
      }
      put api_v1_cart_path(cart3.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "admin fail to update 3 cart" do
      auth_tokens = sign_in(admin)
      params={
        cart: {
          group_id: group3.id,
          item_id: item3.id,
          criteria: 777
        }
      }
      put api_v1_cart_path(cart2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end

    it "user succes to update 2 cart" do
      auth_tokens = sign_in(user2)
      params={
        cart: {
          price: 500
        }
      }
      put api_v1_cart_path(cart.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete No3 cart" do
      auth_tokens = sign_in(admin)
      delete api_v1_cart_path(cart3.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "admin fail to delete No3 cart" do
      auth_tokens = sign_in(admin)
      delete api_v1_cart_path(cart2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end

    it "user succes to delete 2 cart" do
      auth_tokens = sign_in(user3)
      delete api_v1_cart_path(cart2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end
end
