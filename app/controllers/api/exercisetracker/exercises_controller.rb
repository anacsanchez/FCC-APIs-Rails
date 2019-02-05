class Api::Exercisetracker::ExercisesController < ApiController
  def index
    if query_params.empty?
      render json: Exercise.where(user_id: params[:user_id])
    else
      from =  query_params.fetch(:from, Date.new.to_s)
      to = query_params.fetch(:to, Date.today.to_s)
      limit = query_params.fetch(:limit, nil)
      render json: Exercise.where(date: (from..to)).limit(limit)
    end
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      user = User.find(params[:user_id])
      render json: @exercise.attributes.merge("username" => user[:username])
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
