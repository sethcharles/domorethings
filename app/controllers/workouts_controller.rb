class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @workouts = current_user.workouts
  end

  def edit
    if (params[:set])
      @set = WorkoutSet.find_or_initialize_by(id: params[:set], workout: @workout)
      if (@set.new_record?)
        flash.now[:error] = 'Could not find set in this workout.'
      end
    else
      @set = WorkoutSet.new
      @set.workout = @workout
    end
  end

  def new
    workout = Workout.new
    workout.user = current_user
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
      @workout = current_user.workouts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workoutset_params
      params.require(:workout_set).permit(:exercise_id, :reps, :weight)
    end
end
