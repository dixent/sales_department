class Product < ApplicationRecord
  LIST_PRODUCTS = %w[pen pencil].freeze

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :in_stock, presence: true, numericality: { greater_than: 0 }

  has_many :product_sets, dependent: :destroy
  belongs_to :productable, polymorphic: true, dependent: :destroy
end
