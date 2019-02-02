module Api
  class TimestampController < ApiController
    def index
      render json: { "unix" => DateTime.now.strftime("%Q"), "utc" => DateTime.now.httpdate }
    end
    def show
      if !params[:string]
        render json: { "unix" => DateTime.now.strftime("%Q"), "utc" => DateTime.now.httpdate }
      else
        input_time = params[:string].split('-').map { |num| num.to_i }
        render json: { "unix" => DateTime.new(*input_time).strftime("%Q"), "utc" => DateTime.new(*input_time).httpdate }
      end
    end
  end
end
