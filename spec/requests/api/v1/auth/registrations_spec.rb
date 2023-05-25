require 'rails_helper'

RSpec.describe "Api::V1::auth::Users", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  describe "GET /api/v1/admin/users" do
    it "管理権限ユーザーはユーザー情報を全件取得出来る" do
      auth_tokens = sign_in(admin)
      get api_v1_users_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    # it "一般権限ユーザーはユーザー情報を全件取得出来る" do
    #   auth_tokens = sign_in(user2)
    #   get api_v1_users_path, headers: auth_tokens
    #   expect(response).to have_http_status :unauthorized
    # end
  end

  describe "PUT /api/v1/admin/users/:id" do
    it "管理権限ユーザーは他ユーザー情報を更新出来る" do
      auth_tokens = sign_in(admin)
      params={
          user: {
          name: "更新した",
          email: "user@example.com",
          password: "password"
        }
      }
      put api_v1_user_path(user2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    # it "一般権限ユーザーは他ユーザー情報を更新出来ない" do
    #   auth_tokens = sign_in(user2)
    #   params={
    #     user: {
    #     name: "更新した",
    #     email: "user@example.com",
    #     password: "password"
    #   }
    # }
    #   put api_v1_user_path(user2.id), params: params, headers: auth_tokens
    #   expect(response).to have_http_status :unauthorized
    # end
  end

  describe "DELETE /api/v1/admin/user/:id" do
    it "管理権限ユーザーは他ユーザー情報を削除出来る" do
      auth_tokens = sign_in(admin)
      delete api_v1_user_path(user2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    # it "一般権限ユーザーは他ユーザー情報を削除出来ない" do
    #   auth_tokens = sign_in(user2)
    #   delete api_v1_user_path(user2.id), headers: auth_tokens
    #   expect(response).to have_http_status :unauthorized
    # end
  end
end