class Api::ShorturlController < ApiController
  def show
    @shorturl = Shorturl.find(params[:id])
    render json: @shorturl
  end
  def create
    @shorturl = Shorturl.new("original_url" => params[:url])
    if @shorturl.save
      render json: { "original_url" => @shorturl[:original_url], "short_url" => @shorturl[:id] }
    else
      render json: @shorturl.errors.full_messages, status: :unprocessable_entity
    end
  end
end
