FactoryBot.define do
  factory :invitation do
    group_id { 1 }
    user_id { 1 }
  end

  factory :invitation2, class: Invitation do
    group_id { 2 }
    user_id { 2 }
  end

  factory :invitation3, class: Invitation do
    group_id { 3 }
    user_id { 3 }
  end
end