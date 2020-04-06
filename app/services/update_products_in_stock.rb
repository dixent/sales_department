class UpdateProductsInStock
  def initialize(order:)
    @order = order
  end

  def call
    return unless order_reserved_or_unreserved?

    update_products_in_stock
  end

  private

  attr_reader :order, :status

  def order_reserved_or_unreserved?
    order.reserved? || order.unreserved?
  end

  def update_products_in_stock
    order.product_sets.includes(:product).each do |product_set|
      product = product_set.product
      new_product_number =
        if order.reserved?
          product.in_stock - product_set.number
        else
          product.in_stock + product_set.number
        end
      product.update(in_stock: new_product_number)
    end
  end
end
