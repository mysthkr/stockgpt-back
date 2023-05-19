FactoryBot.define do
  factory :to_buy_list do
    group_id { 1 }
    item_id { 1 }
    buy_flag { false }
  end

  factory :to_buy_list2, class: ToBuyList do
    group_id { 2 }
    item_id { 2 }
  end

  factory :to_buy_list3, class: ToBuyList do
    group_id { 3 }
    item_id { 3 }
    buy_flag { true }
  end
end