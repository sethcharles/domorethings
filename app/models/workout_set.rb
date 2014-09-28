class WorkoutSet < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise
  self.table_name = "sets"
end
