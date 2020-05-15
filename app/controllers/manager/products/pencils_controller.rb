class Manager::Products::PencilsController < Manager::ProductsController
  def new
    @pencil = Products::Pencil.new(product: Product.new)
  end

  def create
    @pencil = Products::Pencil.new(
      pencil_params.merge(product: Product.new(product_params))
    )
    if @pencil.product.valid? && @pencil.save
      redirect_to manager_products_url, notice: 'Pencil created successfully!'
    else
      render :new
    end
  end

  def edit
    @pencil = find_pencil
  end

  def update
    @pencil = find_pencil
    if @pencil.update(pencil_params) && @pencil.product.update(product_params)
      flash[:notice] = 'Pencil updated successfully!'
    end

    render :edit
  end

  def destroy
    find_pencil.destroy

    redirect_to manager_products_url, notice: 'Pencil removed successfully!'
  end

  private

  def find_pencil
    Products::Pencil.find(params[:id])
  end

  def pencil_params
    params.require(:products_pencil).permit(:form, :color)
  end

  def product_params
    super(productable_key: :products_pencil)
  end
end
