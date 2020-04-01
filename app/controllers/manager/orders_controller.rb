class Manager::OrdersController < ManagerController
  def index
    @orders = Order.all.includes(product_sets: { product: :productable })
  end

  def new
    @order = Order.new
    @products = Product.all.includes(:productable).each_with_object({}) do |product, hash|
      hash[product.productable.attributes_for_select] = product.id
    end
  end

  def create
    binding.pry
  end


  # def edit
  #   @product = find_product
  # end

  # def update
  #   @product = find_product

  #   amount_received = params.dig(:product, :in_stock).to_i
  #   if Events::UpdateStockOfProduct.new(@product, amount_received).call
  #     redirect_to manager_products_path, notice:
  #       "The stock of #{@product.productable.type}s##{@product.productable.id}" \
  #       " is replenished by #{amount_received}"
  #   else
  #     render :edit
  #   end
  # end

  private

  def order_params
    params.require(:order).permit(:user_data, :'date_of_saling(1i)', :'date_of_saling(2i)', :'date_of_saling(3i)', product_sets_attributes: [:product_id, :number, :_destroy])
  end
  # def find_product
  #   Product.find(params[:id])
  # end
end
