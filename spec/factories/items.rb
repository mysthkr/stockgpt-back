FactoryBot.define do
  factory :item do
    name { "testitem" }
    criteria { 100 }
  end

  factory :item2, class: Item do
    name { "testitem2" }
    criteria { 200 }
  end

  factory :item3, class: Item do
    name { "testitem3" }
    criteria { 3000 }
  end
end