class Manager::Products::PensController < Manager::ProductsController
  def new
    @pen = Products::Pen.new(product: Product.new)
  end

  def create
    @pen = Products::Pen.new(pen_params.merge(product: Product.new(product_params)))
    if @pen.save
      redirect_to manager_products_url, notice: 'Pen created successfully!'
    else
      render :new
    end
  end

  def edit
    @pen = find_pen
  end

  def update
    @pen = find_pen
    if @pen.update(pen_params)
      flash[:notice] = 'Pen updated successfully!'
    end

    render :edit
  end

  def destroy
    find_pen.destroy

    redirect_to redirect_to manager_products_url, notice: 'Pen removed successfully!'
  end

  private

  def find_pen
    Products::Pen.find(params[:id])
  end

  def pen_params
    params.require(:products_pen).permit(:form, :kernel)
  end

  def product_params
    params.require(:products_pen).require(:product).permit(:in_stock, :price)
  end
end
