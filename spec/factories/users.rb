FactoryBot.define do
  factory :admin do
    email { 'testuser@test.com' }
    group_id { 1 }
    password { 'testuser' }
    admin {true}
    business {true}
  end

  factory :user2, class: User do
    email { 'testuser2@test.com' }
    group_id { 2 }
    password { 'testuser2' }
    # admin {false}
    # business {true}
  end

  factory :user3, class: User do
    email { 'testuser3@test.com' }
    group_id { 3 }
    password { 'testuser3' }
    # admin {false}
    business {true}
  end
end