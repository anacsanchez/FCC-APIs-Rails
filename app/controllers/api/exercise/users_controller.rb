class Api::Exercise::UsersController < ApiController
  def index
    render json: User.all
  end
  def show
    @user = User.find(params[:id])
    render json: @user
  end
  def log
    render json: "log"
  end
  def create
    @user = User.new("username" => params[:username])
    if @user.save
      render json: @user
    else
      user.errors.full_messages
    end
  end

end
