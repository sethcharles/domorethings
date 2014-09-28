class Workout < ActiveRecord::Base
  has_many :workout_sets, dependent: :destroy
end
