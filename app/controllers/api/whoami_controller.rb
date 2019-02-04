class Api::WhoamiController < ApiController
  def index
    render json: {
      "ipaddress" => request.remote_ip,
      "language" => request.headers["Accept-Language"],
      "software" => request.headers["User-Agent"]
    }
  end
end
