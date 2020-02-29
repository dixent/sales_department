class Manager::Products::PencilsController < Manager::ProductsController
  def new
    @pencil = Products::Pencil.new
  end

  def create
    @pencil = Products::Pencil.new(
      pencil_params.merge(product: Product.new(product_params))
    )
    if @pencil.save
      redirect_to manager_products_url, notice: 'Pencil created successfully!'
    else
      render :new
    end
  end

  private

  def pencil_params
    params.require(:products_pencil).permit(:form, :color)
  end

  def product_params
    params.require(:products_pencil).require(:product).permit(:in_stock)
  end
end
