require 'resolv.rb'
class Api::ShorturlController < ApiController
  def show
    @shorturl = Shorturl.find(params[:id])
    redirect_to @shorturl[:original_url]
  end

  def create
    begin
      address = Resolv.getaddress(params[:url])
      res = Resolv.getname(address)
      rescue Resolv::ResolvError => e
        render json: {"error" => "invalid URL"}
        return
    end
    @shorturl = Shorturl.new("original_url" => params[:url])
    if @shorturl.save
      render json: { "original_url" => @shorturl[:original_url], "short_url" => @shorturl[:id] }
    else
      render json: @shorturl.errors.full_messages, status: :unprocessable_entity
    end
  end
end
