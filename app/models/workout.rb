class Workout < ActiveRecord::Base
  has_many :workout_sets, dependent: :destroy
  belongs_to :user
end
