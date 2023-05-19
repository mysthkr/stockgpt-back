FactoryBot.define do
  factory :favorite do
    group_id { 1 }
    item_id { 1 }
  end

  factory :favorite2, class: Favorite do
    group_id { 2 }
    item_id { 2 }
  end

  factory :favorite3, class: Favorite do
    group_id { 3 }
    item_id { 3 }
  end
end