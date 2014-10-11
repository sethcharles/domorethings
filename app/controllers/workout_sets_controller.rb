class WorkoutSetsController < ApplicationController
  before_action :set_workout
  before_action :set_workout_set, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @set = WorkoutSet.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @set.update(set_params)
        format.html { redirect_to @workout, notice: 'Exercise was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @set = WorkoutSet.new(set_params)
    @set.workout = @workout

    respond_to do |format|
      if @set.save
        format.html { redirect_to @workout, notice: 'Set was successfully created.' }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @set.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @set.destroy
    respond_to do |format|
      format.html { redirect_to @workout, notice: 'Set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = current_user.workouts.find(params[:workout_id])
    end

    def set_workout_set
      @set = @workout.workout_sets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def set_params
      params.require(:workout_set).permit(:exercise_id, :reps, :weight)
    end
end
