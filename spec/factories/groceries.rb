FactoryBot.define do
  factory :grocery do
    item_id { 1 }
    sub_category_grocery_id { 1 }
    category_grocery_id { 1 }
  end

  factory :grocery2, class: Grocery do
    item_id { 2 }
    sub_category_grocery_id { 2 }
    category_grocery_id { 2 }
  end

  factory :grocery3, class: Grocery do
    item_id { 3 }
    sub_category_grocery_id { 3 }
    category_grocery_id { 3 }
  end
end