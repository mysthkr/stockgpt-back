FactoryBot.define do
  factory :sub_category_grocery do
    name { "testsub_category_grocery" }
    category_product_id { 1 }
  end

  factory :sub_category_grocery2, class: SubCategoryGrocery do
    name { "testsub_category_grocery2" }
    category_product_id { 2 }
  end

  factory :sub_category_grocery3, class: SubCategoryGrocery do
    name { "testsub_category_grocery3" }
    category_product_id { 3 }
  end
end