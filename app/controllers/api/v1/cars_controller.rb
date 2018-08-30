class Api::V1::CarsController < Api::V1::BaseController

  def show
    car = Car.friendly.find(params[:id])
    max_speed_on_track_info = Track.track_info(params[:track], car.max_speed)
    render_json!(200, car.to_h(max_speed_on_track_info))
  end

end
