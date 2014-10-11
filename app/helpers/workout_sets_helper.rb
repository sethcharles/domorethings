module WorkoutSetsHelper
  # These are here because WorkoutSets are aliased nested resources. They fix an
  # issue with form_for.
  #
  # Copied from https://github.com/rails/rails/issues/14451
  def workout_workout_set_path(*args)
    workout_set_path(*args)
  end

  def workout_workout_sets_path(*args)
    workout_sets_path(*args)
  end
end
