require 'rails_helper'

RSpec.describe "Api::V1::CategoryGroceries", type: :request do
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
      get api_v1_category_groceries_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get all category_groceries" do
      auth_tokens = sign_in(user2)
      get api_v1_category_groceries_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 category_grocery" do
      auth_tokens = sign_in(admin)
      get api_v1_category_groceries_path(category_grocery.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get 2 category_grocery" do
      auth_tokens = sign_in(user2)
      get api_v1_category_groceries_path(category_grocery2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end
end
