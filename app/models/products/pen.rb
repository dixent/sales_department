class Products::Pen < ApplicationRecord
  include Productable

  enum form: %i[standard low high]
  enum kernel: %i[m l]

  has_one :product, as: :productable
end
