# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

track_data = [
  { name: 'nurburgring',time_zone: 'CET'}, 
  { name: 'motorsport park',time_zone: 'Sydney'},
  { name: 'circuit gilles villenaeuve montreal',time_zone: 'EST'},
  { name: 'guia circut',time_zone: 'Beijing'}
]

track_data.each_with_index do |track,index| 
  Track.create(name: track[:name], surface_type: Track.surface_types.keys[index] , time_zone:track[:time_zone])
end  

car_data = [
  {name: 'Bugatti Veyron Super Sport', max_speed: 429},
  {name: 'Hennessey Venom GT', max_speed: 418},
  {name: 'Koenigsegg Agera R', max_speed: 418},
  {name: 'SSC Ultimate Aero', max_speed: 413},
  {name: '9ff GT9 R', max_speed: 413},
  {name: 'Saleen S7 Twin Turbo.', max_speed: 399},
]

car_data.each do |car| 
  Car.create(name: car[:name], max_speed: car[:max_speed])
end  
