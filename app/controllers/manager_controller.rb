class ManagerController < AuthenticatedUserController
  before_action :check_manage_or_leader?

  private

  def check_manage_or_leader?
    return if current_user.manager? || current_user.leader?

    raise_access_error
  end
end
