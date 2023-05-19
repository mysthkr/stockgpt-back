require 'rails_helper'

RSpec.describe "Api::V1::Profiles", type: :request do
  let!(:group){ FactoryBot.create(:group) }
  let!(:group2){ FactoryBot.create(:group2) }
  let!(:group3){ FactoryBot.create(:group3) }
  let!(:user2){ FactoryBot.create(:user2, group_id: group.id) }
  let!(:user3){ FactoryBot.create(:user3, group_id: group2.id) }
  let!(:admin){ FactoryBot.create(:admin, group_id: group3.id) }

  let!(:profile){ FactoryBot.create(:profile, user_id: admin.id) }
  let!(:profile2){ FactoryBot.create(:profile2, user_id: user2.id) }
  let!(:profile3){ FactoryBot.create(:profile3, user_id: user3.id) }

  describe "GET /index" do
    it "admin succes to get all profiles" do
      auth_tokens = sign_in(admin)
      get api_v1_profiles_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get all profiles" do
      auth_tokens = sign_in(user2)
      get api_v1_profiles_path, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "GET /show" do
    it "admin succes to get 1 profile" do
      auth_tokens = sign_in(admin)
      get api_v1_profiles_path(profile.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to get 2 profile" do
      auth_tokens = sign_in(user2)
      get api_v1_profiles_path(profile2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  ##########################################
  
  describe "POST /create" do
    it "admin succes to post profile" do
      auth_tokens = sign_in(admin)
      params={
        profile: {
          name: "user name",
          user_id: admin.id,
          nickname: "user nickname",
          roommate_number: 5
        }
      }
      post api_v1_profiles_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end

    it "admin fail to post profile" do
      auth_tokens = sign_in(admin)
      params={
        profile: {
          aaa: "bad_request"
        }
      }
      post api_v1_profiles_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :bad_request
    end

    it "user succes to post profile" do
      auth_tokens = sign_in(user2)
      params={
        profile: {
          name: "user name",
          user_id: user2.id,
          nickname: "user nickname",
          roommate_number: 5
        }
      }
      post api_v1_profiles_path, params: params, headers: auth_tokens
      expect(response).to have_http_status :created
    end
  end

  describe "PATCH/PUT /update" do
    it "admin succes to update 1 profile" do
      auth_tokens = sign_in(admin)
      params={
        profile: {
          name: "edited user name",
          nickname: "edited user nickname"
        }
      }
      put api_v1_profile_path(profile.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to update 2 profile" do
      auth_tokens = sign_in(user2)
      params={
        profile: {
          name: "edited user name",
          nickname: "edited user nickname"
        }
      }
      put api_v1_profile_path(profile2.id), params: params, headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end

  describe "DELETE /destroy" do
    it "admin succes to delete 1 profile" do
      auth_tokens = sign_in(admin)
      delete api_v1_profile_path(profile.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end

    it "user succes to delete 2 profile" do
      auth_tokens = sign_in(user2)
      delete api_v1_profile_path(profile2.id), headers: auth_tokens
      expect(response).to have_http_status :ok
    end
  end
end
