class Track < ApplicationRecord
  enum surface_type: [:snow, :gravel, :asphalt]

  def slowing_factor
    # We can calculate all the slowing factors here
    current_time = Time.now.in_time_zone(time_zone)
    surface_factor + driving_time_factor(current_time)
  end


  def self.track_info(track_name, max_speed)
    return 'no track selected' if track_name.blank?
    track = Track.where(name: track_name).first
    return 'track not found' if track.blank?
    "#{track.max_speed_on_track(max_speed)} km/h" 
  end 

  def max_speed_on_track(max_speed)
    max_speed - ((max_speed / 100) * slowing_factor)    
  end

  def surface_factor
    {snow: 35, gravel: 20, asphalt: 10}[surface_type.to_sym] 
  end


  def driving_time_factor(driving_time)  
    time_frame_factors_hash = {
      '09:00:00AM-11:59:59AM': 0, 
      '12:00:00PM-05:59:00PM': 0, 
      '06:00:00PM-09:30:00PM': 8,
      '09:31:00PM-11:59:59PM': 15,
      '12:00:00AM-05:59:00AM': 15,
      '06:00:00AM-08:59:00AM': 8
    }

    time_info = driving_time.strftime("%d-%b-%Y %z").split(' ')
    time_factor = nil 
    time_frame_factors_hash.each do |time_frame, factor|
      frames = time_frame.to_s.split('-')
      start = DateTime.parse("#{time_info.first} #{frames.first} #{time_info.last}")
      stop =  DateTime.parse("#{time_info.first} #{frames.last} #{time_info.last}")
      time_factor = factor if driving_time.between?(start, stop)
    end
    time_factor
  end  
end