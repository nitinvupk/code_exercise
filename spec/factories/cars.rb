FactoryGirl.define do
  factory :car do
    name { Faker::Commerce.product_name }
    max_speed { [429, 415, 417].sample }
  end
end