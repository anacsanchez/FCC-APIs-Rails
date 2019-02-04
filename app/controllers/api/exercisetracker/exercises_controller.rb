class Api::Exercisetracker::ExercisesController < ApiController
  def index
    render json: Exercise.where(user_id: params[:user_id])
  end
  def create
  end
end
