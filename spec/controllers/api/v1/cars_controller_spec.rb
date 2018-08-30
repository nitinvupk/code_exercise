require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do

  describe "GET #show" do

    it "returns a success response" do
      car = Car.create! attributes_for(:car)
      track = Track.create! attributes_for(:track)

      get :show, params: {id: car.slug, track: track.name}
      expect(response).to be_success
    end

  end

end
