module Errorable
  extend ActiveSupport::Concern

  def raise_access_error
    raise ActionController::RoutingError.new('Not Found')
  end
end
