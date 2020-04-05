class ProductSet < ApplicationRecord
  belongs_to :product

  def summary_price
    number * product.price
  end
end
