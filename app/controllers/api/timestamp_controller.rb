module Api
  class TimestampController < ApiController
    def index
      render json: { "utc" => Time.new.httpdate }
    end
    def show
      if !params[:string]
        render json: { "utc" => Time.new.httpdate }
      else
        input_time = params[:string].split('-').map { |num| num.to_i }
        render json: { "utc" => Time.gm(*input_time).httpdate }
      end
    end
  end
end
