module ApplicationHelper

  ALERTS = {
    notice: 'callout-success',
    alert: 'callout-danger'
  }

  def flash_messages
    flash.map do |key, value|
      tag.div tag.p(value.html_safe), class: ['flash', 'callout', ALERTS[key.to_sym]]
    end.join.html_safe
  end

  def image(file)
    file.present? ? file.url : image_path('default-image.png')
  end

  def date(a_date, *args)
    a_date.present? ? l(a_date, *args) : '-'
  end

  def boolean(bool)
    bool ? 'SI' : 'NO'
  end

end
