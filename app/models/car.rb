require 'friendly_id'
class Car < ApplicationRecord
  extend FriendlyId
  
  friendly_id :name, use: :slugged
  
  def to_h(max_speed_on_track)
    { 
      car: {
        id: id,
        car_slug: slug, 
        max_speed: max_speed, 
        max_speed_on_track: max_speed_on_track
      }
    } 
  end  
end
