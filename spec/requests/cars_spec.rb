require 'rails_helper'

RSpec.describe "Cars", type: :request do


  # Test suite for GET /cars/:id
  describe 'GET api/v1/cars/:id' do
    context 'when the record exists' do
      before do 
        @car = Car.create! attributes_for(:car)
        @track = Track.create! attributes_for(:track)
        @track_info = Track.track_info(@track.name, @car.max_speed)
      end

      it 'returns the json with no track selected' do
        get "/api/v1/cars/#{@car.slug}" 
        expect(json).not_to be_empty
        expect(json['data']['car']['id']).to eq(@car.id)
        expect(json['data']['car']['car_slug']).to eq(@car.slug)
        expect(json['data']['car']['max_speed']).to eq(@car.max_speed)
        expect(json['data']['car']['max_speed_on_track']).to eq("no track selected")
        expect(response).to have_http_status(200)
      end

      it 'returns the json with track not found' do
        get "/api/v1/cars/#{@car.slug}?track=temp" 
        expect(json).not_to be_empty
        expect(json['data']['car']['id']).to eq(@car.id)
        expect(json['data']['car']['car_slug']).to eq(@car.slug)
        expect(json['data']['car']['max_speed']).to eq(@car.max_speed)
        expect(json['data']['car']['max_speed_on_track']).to eq("track not found")
        expect(response).to have_http_status(200)
      end

      it 'returns the json with max_speed_on_track' do
        get "/api/v1/cars/#{@car.slug}?track=#{@track.name}" 
        expect(json).not_to be_empty
        expect(json['data']['car']['id']).to eq(@car.id)
        expect(json['data']['car']['car_slug']).to eq(@car.slug)
        expect(json['data']['car']['max_speed']).to eq(@car.max_speed)
        expect(json['data']['car']['max_speed_on_track']).to eq(@track_info)
        expect(response).to have_http_status(200)
      end

    end

    context 'when the record does not exist' do
      before do 
        car_slug = 'temp'
        car = Car.create! attributes_for(:car)
        track = Track.create! attributes_for(:track)
        get "/api/v1/cars/#{car_slug}" 
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(json['errors']).to eq('Not Found')
      end

      it 'returns a 404 status message' do
        expect(json['status']).to eq(404)
      end

    end
  end

end