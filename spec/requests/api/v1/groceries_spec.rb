require 'rails_helper'

RSpec.describe "Api::V1::Groceries", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:item){ FactoryBot.create(:item) }
  let!(:item2){ FactoryBot.create(:item2) }
  let!(:item3){ FactoryBot.create(:item3) }

  let!(:category_grocery){ FactoryBot.create(:category_grocery) }
  let!(:category_grocery2){ FactoryBot.create(:category_grocery2) }
  let!(:category_grocery3){ FactoryBot.create(:category_grocery3) }

  let!(:sub_category_grocery){ FactoryBot.create(:sub_category_grocery,category_grocery_id: category_grocery.id)}
  let!(:sub_category_grocery2){ FactoryBot.create(:sub_category_grocery2,category_grocery_id: category_grocery2.id) }
  let!(:sub_category_grocery3){ FactoryBot.create(:sub_category_grocery3,category_grocery_id: category_grocery3.id) }

  let!(:grocery){ FactoryBot.create(:grocery, item_id: item.id, 
    sub_category_grocery_id: sub_category_grocery.id, category_grocery_id: category_grocery.id) }
  let!(:grocery2){ FactoryBot.create(:grocery2, item_id: item2.id,
    sub_category_grocery_id: sub_category_grocery2.id, category_grocery_id: sub_category_grocery2.category_grocery_id) }
  let!(:grocery3){ FactoryBot.create(:grocery3, item_id: item3.id,
    sub_category_grocery_id: sub_category_grocery3.id, category_grocery_id: sub_category_grocery3.category_grocery_id) }

  describe "GET /index" do
    it "admin succes to get all groceries" do
      auth_tokens = sign_in(admin)
      get api_v1_groceries_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get all groceries" do
      auth_tokens = sign_in(user2)
      get api_v1_groceries_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 grocery" do
      auth_tokens = sign_in(admin)
      get api_v1_grocery_path(grocery.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get 2 grocery" do
      auth_tokens = sign_in(user2)
      get api_v1_grocery_path(grocery2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get 2 grocery" do
      auth_tokens = sign_in(user2)
      get api_v1_grocery_path(grocery3.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end
end
