module Productable
  extend ActiveSupport::Concern

  included do
    has_one :product, as: :productable, dependent: :destroy
  end

  def type
    self.class.name.split('::').last
  end
end
