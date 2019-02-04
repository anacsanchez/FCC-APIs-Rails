class Api::Exercisetracker::ExercisesController < ApiController
  def index

    # if query_params
    #   render json: Exercise.where(date: query_params[:to]
    # end
    # render json: Exercise.where(user_id: params[:user_id])
  end
  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      render json: @exercise
    else
      render json: @exercise.errors.full_messages
    end
  end

  private

  def exercise_params
    params.permit(:description, :duration, :user_id, :date)
  end
  def query_params
    params.permit(:from, :to, :limit)
  end
end
