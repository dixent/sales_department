class Manager::ProductsController < ManagerController
  def index
    @products = Product.all.includes(:productable)
  end

  def new; end

  def edit: end

  def update; end
end
