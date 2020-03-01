class Manager::ProductsController < ManagerController
  def index
    @products = Product.all.includes(:productable)
  end

  def new; end

  def edit
    @product = find_product
  end

  def update
    @product = find_product

    amount_received = params.dig(:product, :in_stock).to_i
    if Events::UpdateStockOfProduct.new(@product, amount_received).call
      redirect_to manager_products_path, notice:
        "The stock of #{@product.productable.type}s##{@product.productable.id}" \
        " is replenished by #{amount_received}"
    else
      render :edit
    end
  end

  private

  def find_product
    Product.find(params[:id])
  end
end
