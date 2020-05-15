module Productable
  extend ActiveSupport::Concern

  included do
    has_one :product, as: :productable, dependent: :destroy
    has_many :events, as: :subject

    validates :product, presence: true
  end

  def type
    self.class.name.split('::').last
  end
end
