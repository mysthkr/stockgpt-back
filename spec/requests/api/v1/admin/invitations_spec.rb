require 'rails_helper'

RSpec.describe "Api::V1::Admin::Invitations", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:invitation){ FactoryBot.create(:invitation, group_id: group.id, user_id: admin.id) }
  let!(:invitation2){ FactoryBot.create(:invitation2, group_id: group2.id, user_id: user2.id) }
  let!(:invitation3){ FactoryBot.create(:invitation3, group_id: group3.id, user_id: user3.id) }

  describe "GET /index" do
    it "admin succes to get all invitations" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_invitations_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get all invitations" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_invitations_path, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 invitation" do
      auth_tokens = sign_in(admin)
      get api_v1_admin_invitation_path(invitation.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to get 2 invitation" do
      auth_tokens = sign_in(user2)
      get api_v1_admin_invitation_path(invitation2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  ##########################################
  
  describe "POST /create" do
    it "admin succes to post invitation" do
      auth_tokens = sign_in(admin)
      params={
        invitation: {
          group_id: group3.id,
          user_id: user3.id
        }
      }
      post api_v1_admin_invitations_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end

    it "admin fail to post invitation" do
      auth_tokens = sign_in(admin)
      params={
        invitation: {
          aaa: "bad_request"
        }
      }
      post api_v1_admin_invitations_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user fail to post invitation" do
      auth_tokens = sign_in(user2)
      params={
        invitation: {
          group_id: group3.id,
          user_id: user3.id
        }
      }
      post api_v1_admin_invitations_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "PATCH/PUT /update" do
    it "admin succes to update 1 invitation" do
      auth_tokens = sign_in(admin)
      params={
        invitation: {
          group_id: group3.id,
          user_id: user3.id
        }
      }
      put api_v1_admin_invitation_path(invitation.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to update 2 invitation" do
      auth_tokens = sign_in(user2)
      params={
        invitation: {
          group_id: group3.id,
          user_id: user3.id
        }
      }
      put api_v1_admin_invitation_path(invitation2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete 1 invitation" do
      auth_tokens = sign_in(admin)
      delete api_v1_admin_invitation_path(invitation.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user fail to delete 2 invitation" do
      auth_tokens = sign_in(user2)
      delete api_v1_admin_invitation_path(invitation2.id), headers: auth_tokens
      expect(response).to have_http_status :unauthorized
    end
  end
end
