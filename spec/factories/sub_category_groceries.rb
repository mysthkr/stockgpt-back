FactoryBot.define do
  factory :sub_category_grocery do
    name { "testsub_category_grocery" }
    category_grocery_id { 1 }
  end

  factory :sub_category_grocery2, class: SubCategoryGrocery do
    name { "testsub_category_grocery2" }
    category_grocery_id { 2 }
  end

  factory :sub_category_grocery3, class: SubCategoryGrocery do
    name { "testsub_category_grocery3" }
    category_grocery_id { 3 }
  end
end