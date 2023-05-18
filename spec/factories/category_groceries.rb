FactoryBot.define do
  factory :category_grocery do
    name { "testcategory_grocery" }
  end

  factory :category_grocery2, class: CategoryGrocery do
    name { "testcategory_grocery2" }
  end

  factory :category_grocery3, class: CategoryGrocery do
    name { "testcategory_grocery3" }
  end
end