module TasksHelper
  def to_datetime_format(datetime)
    datetime.strftime("%d.%m.%y %H:%M")
  end

  def distance_to_deadline_in_words(task)
    if task.done?
      I18n.t("tasks.messages.closed", distance: distance_of_time_in_words(DateTime.now, task.closed_at))
    else
      if DateTime.now > task.deadline
        I18n.t('tasks.messages.late', distance: distance_of_time_in_words(DateTime.now, task.deadline))
      else
        I18n.t('tasks.messages.left', distance: distance_of_time_in_words(DateTime.now, task.deadline))
      end
    end
  end

  def priority_in_words(priority)
    case priority
    when 1
      I18n.t('tasks.priorities.low')
    when 2
      I18n.t('tasks.priorities.medium')
    when 3
      I18n.t('tasks.priorities.high')
    end
  end
end
