require 'rails_helper'

RSpec.describe Car, type: :model do


  context 'custom method to_h' do
    let(:max_speed_on_track) { 'Sama as Given' }    

    before do 
      @car = create(:car) 
      @to_h_value = @car.to_h(max_speed_on_track)
    end

    it { expect(@to_h_value[:car][:id]).to eq(@car.id) }    
    it { expect(@to_h_value[:car][:car_slug]).to eq(@car.slug) }    
    it { expect(@to_h_value[:car][:max_speed]).to eq(@car.max_speed) }    
    it { expect(@to_h_value[:car][:max_speed_on_track]).to eq(max_speed_on_track) }    

  end  

end
