class Api::FileMetadataController < ApiController
  def index
    render json: params
  end
  def upload
    file = params.fetch("upfile")
    render json: {
      "name" => file.original_filename,
      "type" => file.content_type,
      "size" => file.size
    }
  end
end
