module ApplicationHelper
  def to_minutes(time_elapsed)
    (time_elapsed / 60).round
  end
end
