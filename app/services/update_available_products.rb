class UpdateAvailableProducts
  def initialize(order:)
    @order = order
  end

  def call
    return unless order_reserved_or_unreserved?

    update_availabe
  end

  private

  attr_reader :order, :status

  def order_reserved_or_unreserved?
    order.reserved? || order.unreserved?
  end

  def update_availabe
    order.product_sets.includes(:product).each do |product_set|
      product = product_set.product
      new_product_number =
        if order.reserved?
          product.available - product_set.number
        else
          product.available + product_set.number
        end
      product.update!(available: new_product_number)
    end
  end
end
