class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy, :add_set]

  def index
    @workouts = Workout.all
  end

  def edit
    @set = WorkoutSet.new
    @set.workout = @workout
  end

  def add_set
    set = WorkoutSet.new(workoutset_params)
    set.workout = @workout
    set.save!
    redirect_to @workout
  end

  def new
    workout = Workout.new
    workout.started_at = Time.zone.now
    workout.save!

    redirect_to workout
  end

  def destroy
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workoutset_params
      params.require(:workout_set).permit(:exercise_id, :reps, :weight)
    end
end
