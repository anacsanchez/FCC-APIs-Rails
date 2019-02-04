class Api::WhoamiController < ApiController
  def index
    render json: {
      "ipaddress" => request.ip,
      "language" => request.headers["Accept-Language"],
      "software" => request.headers["User-Agent"]
    }
  end
end
