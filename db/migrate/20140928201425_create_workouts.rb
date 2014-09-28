class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.timestamps
    end

    create_table :sets do |t|
      t.decimal :weight
      t.integer :reps
      t.belongs_to :workout
      t.belongs_to :exercise
      t.timestamps
    end
  end
end
