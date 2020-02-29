class ManagerController < AuthenticatedUserController
  before_action :check_manage_or_admin?

  private

  def check_manage_or_admin?
    return if current_user.manager? || current_user.admin?

    raise_access_error
  end
end
