FactoryBot.define do
  factory :stock_item do
    group_id { 1 }
    criteria { 1 }
    item_id { 1 }
    alarm_date { "2020-01-01" }
    price { 1 }
    shop_id { 1 }
    quantity { 1 }
  end

  factory :stock_item2, class: StockItem do
    group_id { 2 }
    criteria { 2 }
    item_id { 2 }
    alarm_date { "2020-02-22" }
    price { 222 }
    shop_id { 2 }
    quantity { 22 }
  end

  factory :stock_item3, class: StockItem do
    group_id { 3 }
    criteria { 3 }
    item_id { 3 }
    alarm_date { "2023-03-03" }
    price { 3333 }
    shop_id { 3 }
    quantity { 333 }
  end
end