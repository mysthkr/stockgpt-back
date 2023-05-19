FactoryBot.define do
  factory :category_product do
    name { "testcategory_product" }
  end

  factory :category_product2, class: CategoryProduct do
    name { "testcategory_product2" }
  end

  factory :category_product3, class: CategoryProduct do
    name { "testcategory_product3" }
  end
end