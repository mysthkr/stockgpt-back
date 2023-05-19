FactoryBot.define do
  factory :shop do
    name { "testshop" }
    prefecture { "Yamanashi" }
  end

  factory :shop2, class: Shop do
    name { "testshop2" }
    prefecture { "Toyama" }
  end

  factory :shop3, class: Shop do
    name { "testshop3" }
    prefecture { "Tokyo" }
  end
end