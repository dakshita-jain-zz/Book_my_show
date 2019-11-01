module ApplicationHelper
  def current_user
    @current_user ||= User.current
  end
end
