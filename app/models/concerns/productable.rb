module Productable
  include ActiveSupport::Concern

  def type
    self.class.name.split('::').last
  end
end
