class Manager::ProductsController < ManagerController
  def index
    @products = Product.all.includes(:productable)
  end

  def new; end

  def show
    @product = Product.includes(product_sets: { order: :client}).find(params[:id])
  end

  def edit
    @product = find_product
  end

  def update
    @product = find_product

    amount_received = params.dig(:product, :in_stock).to_i
    if Events::UpdateStockOfProduct.new(
        product: @product,
        amount_received: amount_received
      ).call
      redirect_to manager_products_path, notice:
        "The stock of #{@product.productable.type}s##{@product.id}" \
        " is replenished by #{amount_received}"
    else
      render :edit
    end
  end

  private

  def find_product
    Product.find(params[:id])
  end

  def product_params(productable_key:)
    return @product_params if @product_params

    @product_params = params.require(productable_key).require(:product).permit(:in_stock, :price)
    @product_params[:available] = @product_params[:in_stock]
    @product_params
  end
end
