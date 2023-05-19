FactoryBot.define do
  factory :request do
    user_id { 1 }
    request_type  { 1 }
    request_name { "testrequest" }
  end

  factory :request2, class: Request do
    user_id { 2 }
    request_type  { 2 }
    request_name { "testrequest2" }
    register_flag { false }
  end

  factory :request3, class: Request do
    user_id { 3 }
    request_type  { 3 }
    request_name { "testrequest3" }
    register_flag { true }
  end
end