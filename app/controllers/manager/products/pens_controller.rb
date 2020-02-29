class Manager::Products::PensController < Manager::ProductsController
  def new
    @pen = Products::Pen.new
  end

  def create
    @pen = Products::Pen.new(pen_params.merge(product: Product.new(product_params)))
    if @pen.save
      redirect_to manager_products_url, notice: 'Pen created successfully!'
    else
      render :new
    end
  end

  private

  def pen_params
    params.require(:products_pen).permit(:form, :kernel)
  end

  def product_params
    params.require(:products_pen).require(:product).permit(:in_stock)
  end
end
