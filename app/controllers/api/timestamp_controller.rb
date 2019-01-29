module Api
  class TimestampController < ApiController
    def index
      render json: params[:timestamp]
    end
  end
end
