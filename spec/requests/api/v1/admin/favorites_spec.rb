require 'rails_helper'

RSpec.describe "Api::V1::Admin::Favorites", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:item){ FactoryBot.create(:item) }
  let!(:item2){ FactoryBot.create(:item2) }
  let!(:item3){ FactoryBot.create(:item3) }

  let!(:favorite){ FactoryBot.create(:favorite, group_id: group.id, item_id: item.id) }
  let!(:favorite2){ FactoryBot.create(:favorite2, group_id: group2.id, item_id: item2.id) }
  let!(:favorite3){ FactoryBot.create(:favorite3, group_id: group3.id, item_id: item3.id) }

  describe "GET /index" do
    it "admin succes to get all favorites" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_favorites_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get all favorites" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_favorites_path, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 favorite" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_favorite_path(favorite.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get 2 favorite" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_favorite_path(favorite2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  ##########################################
  
  describe "POST /create" do
    # it "admin succes to post favorite" do
    #   auth_tokens = sign_in(admin)
    #   params={
    #     favorite: {
    #       group_id: group3.id,
    #       item_id: item3.id
    #     }
    #   }
    #   post api_v1_admin_favorites_path, params: params, headers: auth_tokens
    #   expect(response).to have_http_status :created
    # end

    it "admin fail to post favorite" do
      auth_tokens = sign_in(admin)
      params={
        favorite: {
          aaa: "bad_request"
        }
      }
      post api_v1_admin_favorites_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user fail to post favorite" do
      auth_tokens = sign_in(user2)
      params={
        favorite: {
          group_id: group3.id,
          item_id: item3.id
        }
      }
      post api_v1_admin_favorites_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "PATCH/PUT /update" do
    # it "admin succes to update 1 favorite" do
    #   auth_tokens = sign_in(admin)
    #   params={
    #     favorite: {
    #       group_id: group3.id,
    #       item_id: item3.id
    #     }
    #   }
    #   put api_v1_admin_favorite_path(favorite.id), params: params, headers: auth_tokens
    #   expect(response).to have_http_status :ok
    # end

    it "user fail to update 2 favorite" do
      auth_tokens = sign_in(user2)
      params={
        favorite: {
        name: "test favorite updated"
        }
      }
      put api_v1_admin_favorite_path(favorite2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete 1 favorite" do
      auth_tokens = sign_in(admin)
      delete api_v1_admin_favorite_path(favorite.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to delete 2 favorite" do
      auth_tokens = sign_in(user2)
      delete api_v1_admin_favorite_path(favorite2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end
end
