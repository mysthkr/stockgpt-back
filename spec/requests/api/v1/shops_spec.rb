require 'rails_helper'

RSpec.describe "Api::V1::Shops", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:shop){ FactoryBot.create(:shop) }
  let!(:shop2){ FactoryBot.create(:shop2) }
  let!(:shop3){ FactoryBot.create(:shop3) }

  describe "GET /index" do
    it "admin succes to get all shops" do
      auth_tokens = sign_in(admin)
      get api_v1_shops_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get all shops" do
      auth_tokens = sign_in(user2)
      get api_v1_shops_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 shop" do
      auth_tokens = sign_in(admin)
      get api_v1_shop_path(shop.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get 2 shop" do
      auth_tokens = sign_in(user2)
      get api_v1_shop_path(shop2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end
end
