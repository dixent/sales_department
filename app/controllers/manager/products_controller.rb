class Manager::ProductsController < ManagerController
  def index
    @products = Product.all.includes(:productable)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product created successful!'
    else
      render :new
    end
  end

  private

  def product_params
    binding.pry
  end

  def product
    @product ||= Product.find(params[:id])
  end
end
