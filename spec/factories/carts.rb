FactoryBot.define do
  factory :cart do
    group_id { 1 }
    item_id { 1 }
    criteria { 100 }
    price { 100 }
  end

  factory :cart2, class: Cart do
    group_id { 2 }
    item_id { 2 }
    criteria { 200 }
    price { 200 }
  end

  factory :cart3, class: Cart do
    group_id { 3 }
    item_id { 3 }
    criteria { 300 }
    price { 300 }
  end
end