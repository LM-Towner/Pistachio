module ApplicationHelper
  def long_form_date(timestamp)
    timestamp.strftime('%B %e, %Y')
  end
  def time(timestamp)
    timestamp.strftime("%I:%M%p")
  end
end
