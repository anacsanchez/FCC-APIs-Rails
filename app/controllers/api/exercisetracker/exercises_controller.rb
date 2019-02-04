class Api::Exercisetracker::ExercisesController < ApiController
  def index
    render json: Exercise.where(user_id: params[:user_id])
  end
  def create
    render json: exercise_params
  end

  private

  def exercise_params
    params.permit(:description, :duration, :user_id, :date)
  end
end
