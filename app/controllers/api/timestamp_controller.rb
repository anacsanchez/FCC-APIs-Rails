module Api
  class TimestampController < ApiController
    # def index
    #   render json: { "unix" => Time.new.millisecond, "utc" => Time.new }
    # end
    def show
      if !params[:string]
        render json: { "unix" => DateTime.now.strftime("%Q"), "utc" => DateTime.now.httpdate }
      else
        input_time = params[:string].split('-').map { |num| num.to_i }
        render json: { "utc" => Time.gm(*input_time).httpdate }
      end
    end
  end
end
