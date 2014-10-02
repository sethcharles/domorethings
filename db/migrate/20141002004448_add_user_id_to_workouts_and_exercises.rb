class AddUserIdToWorkoutsAndExercises < ActiveRecord::Migration
  def change
    add_column :workouts, :user_id, :integer
    add_column :exercises, :user_id, :integer
  end
end
