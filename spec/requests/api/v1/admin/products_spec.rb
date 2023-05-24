require 'rails_helper'

RSpec.describe "Api::V1::Admin::Products", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:item){ FactoryBot.create(:item) }
  let!(:item2){ FactoryBot.create(:item2) }
  let!(:item3){ FactoryBot.create(:item3) }

  let!(:category_product){ FactoryBot.create(:category_product) }
  let!(:category_product2){ FactoryBot.create(:category_product2) }
  let!(:category_product3){ FactoryBot.create(:category_product3) }

  let!(:sub_category_product){ FactoryBot.create(:sub_category_product,category_product_id: category_product.id)}
  let!(:sub_category_product2){ FactoryBot.create(:sub_category_product2,category_product_id: category_product2.id) }
  let!(:sub_category_product3){ FactoryBot.create(:sub_category_product3,category_product_id: category_product3.id) }

  let!(:product){ FactoryBot.create(:product, item_id: item.id, 
    sub_category_product_id: sub_category_product.id, category_product_id: category_product.id) }
  let!(:product2){ FactoryBot.create(:product2, item_id: item2.id,
    sub_category_product_id: sub_category_product2.id, category_product_id: sub_category_product2.category_product_id) }
  let!(:product3){ FactoryBot.create(:product3, item_id: item3.id,
    sub_category_product_id: sub_category_product3.id, category_product_id: sub_category_product3.category_product_id) }

  describe "GET /index" do
    it "admin succes to get all products" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_products_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get all products" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_products_path, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 product" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_products_path(product.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get 2 product" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_products_path(product2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  ##########################################
  
  describe "POST /create" do
    it "admin succes to post product" do
      auth_tokens = sign_in(admin)
      params={
        product: {
          item_id: item.id,
          sub_category_product_id: sub_category_product2.id, 
          category_product_id: category_product3.id
        }
      }
      post api_v1_admin_products_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end

    it "admin fail to post product" do
      auth_tokens = sign_in(admin)
      params={
        product: {
          aaa: "bad_request"
        }
      }
      post api_v1_admin_products_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user fail to post product" do
      auth_tokens = sign_in(user2)
      params={
        product: {
          item_id: item.id,
          sub_category_product_id: sub_category_product2.id, 
          category_product_id: category_product3.id
        }
      }
      post api_v1_admin_products_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "PATCH/PUT /update" do
    it "admin succes to update 1 product" do
      auth_tokens = sign_in(admin)
      params={
        product: {
          item_id: item3.id
        }
      }
      put api_v1_admin_product_path(product.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to update 2 product" do
      auth_tokens = sign_in(user2)
      params={
        product: {
          item_id: item3.id
        }
      }
      put api_v1_admin_product_path(product2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete 1 product" do
      auth_tokens = sign_in(admin)
      delete api_v1_admin_product_path(product.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to delete 2 product" do
      auth_tokens = sign_in(user2)
      delete api_v1_admin_product_path(product2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end
end
