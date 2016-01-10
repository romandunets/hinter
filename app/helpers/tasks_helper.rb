module TasksHelper
  def to_datetime_format(datetime)
    datetime.strftime("%d.%m.%y %H:%M")
  end

  def distance_to_deadline_in_words(task)
    if task.done?
      "Closed #{distance_of_time_in_words(DateTime.now, task.closed_at)} ago"
    else
      "#{distance_of_time_in_words(DateTime.now, task.deadline)} #{(DateTime.now > task.deadline) ? ' late' : ' left' }"
    end
  end

  def priority_in_words(priority)
    case priority
    when 1
      "Low"
    when 2
      "Medium"
    when 3
      "High"
    end
  end
end
