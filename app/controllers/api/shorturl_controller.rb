class Api::ShorturlController < ApiController
  def index
    render json: Shorturl.all
  end
  def new
    @shorturl = Shorturl.new(params[:url])
    if @shorturl.save
      redirect_to api_shorturl_index
    else
      render json: "error occurred"
    end
  end
end
