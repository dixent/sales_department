class Order < ApplicationRecord
  has_many :product_sets
  accepts_nested_attributes_for :product_sets, reject_if: :all_blank, allow_destroy: true

  enum status: %i[opened unreserved reserved closed]
end
