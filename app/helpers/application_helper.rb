module ApplicationHelper
  ALERT_TYPE = {
    'notice' => 'success',
    'alert' => 'danger',
    'primary' => 'primary'
  }.freeze

  def render_alerts
    flash.map do |type, message|
      "<div class=\"alert alert-#{ALERT_TYPE[type]}\" role=\"alert\">" \
        "#{message}" \
        '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' \
          '<span aria-hidden="true">&times;</span>' \
        '</button>' \
      "</div>"
    end.join('').html_safe
  end
end
