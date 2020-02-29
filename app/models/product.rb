class Product < ApplicationRecord
  LIST_PRODUCTS = %w[pen pencil].freeze

  has_one :product_set
  belongs_to :productable, polymorphic: true
end
