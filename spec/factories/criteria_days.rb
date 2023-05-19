FactoryBot.define do
  factory :criteria_day do
    group_id { 1 }
    item_id { 1 }
    criteria { 123 }
  end

  factory :criteria_day2, class: CriteriaDay do
    group_id { 2 }
    item_id { 2 }
    criteria { 234 }
  end

  factory :criteria_day3, class: CriteriaDay do
    group_id { 3 }
    item_id { 3 }
    criteria { 345 }
  end
end