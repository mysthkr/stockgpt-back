FactoryBot.define do
  factory :sub_category_product do
    name { "testsub_category_product" }
    category_product_id { 1 }
  end

  factory :sub_category_product2, class: SubCategoryProduct do
    name { "testsub_category_product2" }
    category_product_id { 2 }
  end

  factory :sub_category_product3, class: SubCategoryProduct do
    name { "testsub_category_product3" }
    category_product_id { 3 }
  end
end