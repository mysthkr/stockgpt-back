require 'rails_helper'

RSpec.describe "Api::V1::CategoryProducts", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:category_product){ FactoryBot.create(:category_product) }
  let!(:category_product2){ FactoryBot.create(:category_product2) }
  let!(:category_product3){ FactoryBot.create(:category_product3) }

  describe "GET /index" do
    it "admin succes to get all category_products" do
      auth_tokens = sign_in(admin)
      get api_v1_category_products_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get all category_products" do
      auth_tokens = sign_in(user2)
      get api_v1_category_products_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 category_product" do
      auth_tokens = sign_in(admin)
      get api_v1_category_products_path(category_product.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get 2 category_product" do
      auth_tokens = sign_in(user2)
      get api_v1_category_products_path(category_product2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  ##########################################
  
  describe "POST /create" do
    it "admin succes to post category_product" do
      auth_tokens = sign_in(admin)
      params={
        category_product: {
        name: "test category_product posted"
        }
      }
      post api_v1_category_products_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end

    it "admin fail to post category_product" do
      auth_tokens = sign_in(admin)
      params={
        category_product: {
        aaa: "bad_request"
        }
      }
      post api_v1_category_products_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user succes to post category_product" do
      auth_tokens = sign_in(user2)
      params={
        category_product: {
          name: "test category_product posted"
        }
      }
      post api_v1_category_products_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end
  end

  describe "PATCH/PUT /update" do
    it "admin succes to update 1 category_product" do
      auth_tokens = sign_in(admin)
      params={
        category_product: {
        name: "test category_product posted"
        }
      }
      put api_v1_category_product_path(category_product.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to update 2 category_product" do
      auth_tokens = sign_in(user2)
      params={
        category_product: {
        name: "test category_product posted"
        }
      }
      put api_v1_category_product_path(category_product2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete 1 category_product" do
      auth_tokens = sign_in(admin)
      delete api_v1_category_product_path(category_product.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to delete 2 category_product" do
      auth_tokens = sign_in(user2)
      delete api_v1_category_product_path(category_product2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end
end
