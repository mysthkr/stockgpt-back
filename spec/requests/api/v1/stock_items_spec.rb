require 'rails_helper'

RSpec.describe "Api::V1::StockItems", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:item){ FactoryBot.create(:item) }
  let!(:item2){ FactoryBot.create(:item2) }
  let!(:item3){ FactoryBot.create(:item3) }

  let!(:shop){ FactoryBot.create(:shop) }
  let!(:shop2){ FactoryBot.create(:shop2) }
  let!(:shop3){ FactoryBot.create(:shop3) }

  let!(:stock_item){ FactoryBot.create(:stock_item, item_id: item.id, group_id: group.id, shop_id: shop.id) }
  let!(:stock_item2){ FactoryBot.create(:stock_item2, item_id: item2.id, group_id: group2.id, shop_id: shop2.id) }
  let!(:stock_item3){ FactoryBot.create(:stock_item3, item_id: item3.id, group_id: group3.id, shop_id: shop3.id) }

  describe "GET /index" do
    it "admin succes to get all stock_items" do
      auth_tokens = sign_in(admin)
      get api_v1_stock_items_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get all stock_items" do
      auth_tokens = sign_in(user2)
      get api_v1_stock_items_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 stock_item" do
      auth_tokens = sign_in(admin)
      get api_v1_stock_items_path(stock_item.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get 2 stock_item" do
      auth_tokens = sign_in(user2)
      get api_v1_stock_items_path(stock_item2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  ##########################################
  
  describe "POST /create" do
    it "admin succes to post stock_item" do
      auth_tokens = sign_in(admin)
      params={
        stock_item: {
          group_id: group3.id,
          item_id: item3.id,
          shop_id: shop3.id,
          criteria: 333,
          alarm_date: "2021-01-01",
          price: 333,
          quantity: 3
        }
      }
      post api_v1_stock_items_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end

    it "admin fail to post stock_item" do
      auth_tokens = sign_in(admin)
      params={
        stock_item: {
          aaa: "bad_request"
        }
      }
      post api_v1_stock_items_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user succes to post stock_item" do
      auth_tokens = sign_in(user2)
      params={
        stock_item: {
          group_id: group3.id,
          item_id: item3.id,
          shop_id: shop3.id,
          criteria: 333,
          alarm_date: "2021-01-01",
          price: 333,
          quantity: 3
        }
      }
      post api_v1_stock_items_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end
  end

  describe "PATCH/PUT /update" do
    it "admin succes to update 1 stock_item" do
      auth_tokens = sign_in(admin)
      params={
        stock_item: {
          group_id: group2.id,
          item_id: item2.id,
          shop_id: shop2.id,
          criteria: 555,
          price: 555,
          quantity: 555
        }
      }
      put api_v1_stock_item_path(stock_item3.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to update 2 stock_item" do
      auth_tokens = sign_in(user2)
      params={
        stock_item: {
          criteria: 555,
          price: 555,
          quantity: 555
        }
      }
      put api_v1_stock_item_path(stock_item.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to update 2 stock_item" do
      auth_tokens = sign_in(user2)
      params={
        stock_item: {
          criteria: 555,
          price: 555,
          quantity: 555
        }
      }
      put api_v1_stock_item_path(stock_item2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete 1 stock_item" do
      auth_tokens = sign_in(admin)
      delete api_v1_stock_item_path(stock_item3.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to delete 2 stock_item" do
      auth_tokens = sign_in(user2)
      delete api_v1_stock_item_path(stock_item.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to delete 2 stock_item" do
      auth_tokens = sign_in(user2)
      delete api_v1_stock_item_path(stock_item2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end
end
