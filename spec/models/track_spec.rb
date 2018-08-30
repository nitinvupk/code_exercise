require 'rails_helper'

RSpec.describe Track, type: :model do







  context 'custom method surface_factor' do

    it 'surface factor 35 for snow' do
      track = create(:track, surface_type: :snow)
      expect(track.surface_factor).to eq(35)
    end  

    it 'surface factor 20 for snow' do
      track = create(:track, surface_type: :gravel)
      expect(track.surface_factor).to eq(20)
    end  

    it 'surface factor 20 for snow' do
      track = create(:track, surface_type: :asphalt)
      expect(track.surface_factor).to eq(10)
    end  

  end  


  context 'custom method driving_time_factor' do
    before do 
      @track = create(:track)
      @driving_time = Time.now.in_time_zone(@track.time_zone).beginning_of_day
    end

    it 'driving time factor 0 for 10.hours' do
      expect(@track.driving_time_factor(@driving_time+10.hours)).to eq(0)
    end  

    it 'driving time factor 0 for 14.hours' do
      expect(@track.driving_time_factor(@driving_time+14.hours)).to eq(0)
    end  

    it 'driving time factor 8 for 20.hours' do
      expect(@track.driving_time_factor(@driving_time+20.hours)).to eq(8)
    end  

    it 'driving time factor 8 for 23.hours' do
      expect(@track.driving_time_factor(@driving_time+23.hours)).to eq(15)
    end  

    it 'driving time factor 8 for 3.hours' do
      expect(@track.driving_time_factor(@driving_time+3.hours)).to eq(15)
    end  

    it 'driving time factor 8 for 7.hours' do
      expect(@track.driving_time_factor(@driving_time+7.hours)).to eq(8)
    end  

  end  


  context 'custom class method track_info' do

    before do 
      @car = create(:car)
      @track = create(:track)
      @info_value = @track.max_speed_on_track(@car.max_speed)  
    end
    
    it { expect(Track.track_info(nil, @car.max_speed)).to eq("no track selected") }    
    it { expect(Track.track_info('temp', @car.max_speed)).to eq("track not found") }    
    it { expect(Track.track_info(@track.name, @car.max_speed)).to eq("#{@info_value} km/h") }    

  end  

end
