module Productable
  extend ActiveSupport::Concern

  included do
    has_one :product, as: :productable, dependent: :destroy
    has_many :events, as: :subject
  end

  def type
    self.class.name.split('::').last
  end
end
