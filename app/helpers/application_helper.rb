module ApplicationHelper
  def foundation_alert(type, text)
    content_tag(:div, text, {class: [type, "alert-box"]}, false)
  end
end
