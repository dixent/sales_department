class Events::UpdateStockOfProduct
  def initialize(product:, amount_received:)
    @product = product
    @amount_received = amount_received
  end

  def call
    if @product.update(in_stock: @product.in_stock + @amount_received)
      Event.create(subject: @product.productable,
                   value: @amount_received,
                   operation_type: Event.operation_types[:increase])

      return true
    end

    false
  end
end
