
class Api::TimestampController < ApiController
  def index
    render json: { "unix" => DateTime.now.strftime("%Q"), "utc" => DateTime.now.httpdate }
  end

  def show
    if !params[:string]
      render json: { "unix" => DateTime.now.strftime("%Q"), "utc" => DateTime.now.httpdate }
    else
      input_time = params[:string].split('-').map { |num| num.to_i }

      if input_time.length == 1
        render json: { "unix" => input_time[0], "utc" => DateTime.strptime(input_time[0].to_s, "%Q") }
      elsif input_time.length == 3
        render json: { "unix" => DateTime.new(*input_time).strftime("%Q"), "utc" => DateTime.new(*input_time).httpdate }
      else
        render json: { "error" => "Invalid Date" }
      end
    end
  end
end

