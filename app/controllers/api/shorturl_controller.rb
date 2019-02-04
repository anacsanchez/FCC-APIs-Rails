class Api::ShorturlController < ApiController
  def index
    render json: Shorturl.all
  end
  def create
    @shorturl = Shorturl.new("original_url" => params[:url])
    if @shorturl.save
      render json: { "original_url" => @shorturl[:original_url], "short_url" => @shorturl[:id] }
    else
      render json: "error occurred"
    end
  end
end
