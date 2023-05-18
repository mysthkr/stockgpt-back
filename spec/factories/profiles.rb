FactoryBot.define do
  factory :profile do
    user_id { 1 }
    name { "testuser" }
    nickname { "admin" }
    roommate_number { 1 }
    # prefecture { 1 }
  end

  factory :profile2, class: Profile do
    user_id { 1 }
    name { "testuser" }
    nickname { "admin" }
    prefecture { "Toyama" }
  end

  factory :profile3, class: Profile do
    user_id { 1 }
    name { "testuser" }
    nickname { "admin" }
    roommate_number { 3 }
    prefecture { "Tokyo" }
  end
end