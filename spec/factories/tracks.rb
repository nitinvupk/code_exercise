FactoryGirl.define do
  factory :track do
    name { Faker::Commerce.product_name }
    surface_type { Track.surface_types.keys.sample } 
    time_zone { ['CET', 'EST', 'Sydney', 'Beijing'].sample }

  end
end
