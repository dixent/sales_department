class ProductSet < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :number, presence: true, numericality: { greater_than: 0 }

  def summary_price
    number * product.price
  end
end
