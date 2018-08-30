class Api::V1::BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, with: :not_found!

  protected

  def render_json!(status, data)
    render_json(status: status, data: data)
  end 

  def not_found!
    return render_error(status: 404, errors: 'Not Found')
  end


  private

  def render_json(status: 200, data: nil)
    head status: status and return if data.empty?
    render json: { data: data, status: status}, status: status
  end  

  def render_error(status: 500, errors: [])
    head status: status and return if errors.empty?
    render json: { errors: errors, status: status}, status: status
  end

end
