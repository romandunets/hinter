module TasksHelper
  def distance_to_deadline_in_words(deadline)
    "#{distance_of_time_in_words(DateTime.now, deadline)} #{(DateTime.now > deadline) ? ' late' : ' left' }"
  end
end
