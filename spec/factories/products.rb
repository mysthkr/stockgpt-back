FactoryBot.define do
  factory :product do
    item_id { 1 }
    sub_category_product_id { 1 }
    category_product_id { 1 }
  end

  factory :product2, class: Product do
    item_id { 2 }
    sub_category_product_id { 2 }
    category_product_id { 2 }
    picture { "testpicture2" }
  end

  factory :product3, class: Product do
    item_id { 3 }
    sub_category_product_id { 3 }
    category_product_id { 3 }
  end
end