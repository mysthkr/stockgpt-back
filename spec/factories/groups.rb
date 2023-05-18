FactoryBot.define do
  factory :group do
    name { 'testgroup' }
  end

  factory :group2, class: Group do
    name { 'testgroup2' }
  end

  factory :group3, class: Group do
    name { 'testgroup3' }
  end
end