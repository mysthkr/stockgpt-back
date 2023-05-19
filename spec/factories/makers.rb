FactoryBot.define do
  factory :maker do
    name { "testmaker" }
  end

  factory :maker2, class: Maker do
    name { "testmaker2" }
  end

  factory :maker3, class: Maker do
    name { "testmaker3" }
  end
end