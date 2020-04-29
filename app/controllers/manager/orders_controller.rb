class Manager::OrdersController < ManagerController
  def index
    @orders = Order.order(id: :desc).includes(product_sets: { product: :productable })

    if params[:status]
      @orders = @orders.where(status: params[:status])
    else
      @orders = @orders.where.not(status: :closed)
    end
  end

  def new
    @order = Order.new
    @products = Product.all.includes(:productable).each_with_object({}) do |product, hash|
      hash[product.productable.attributes_for_select] = product.id
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to manager_orders_url
    else
      render :new
    end
  end

  def show
    @order = Order.includes(product_sets: { product: :productable }).find(params[:id])
  end

  def update
    @order = find_order

    if @order.opened? && %w[unreserved reserved].include?(params[:status]) &&
      !current_user.leader?

      redirect_to manager_orders_url, alert: 'Access denied!'
    end

    if @order.update(status: params[:status])
      UpdateProductsInStock.new(order: @order).call
    else
      flash['error'] = 'Status invalid!'
    end

    redirect_to manager_orders_url
  end

  def destroy
    @order = find_order

    @order.destroy

    redirect_to manager_orders_url
  end

  private

  def order_params
    params.require(:order).permit(:user_data, :'date_of_saling(1i)', :lng, :lat,
                                  :'date_of_saling(2i)', :'date_of_saling(3i)',
                                  product_sets_attributes:
                                    [:product_id, :number, :_destroy])
  end

  def find_order
    Order.find(params[:id])
  end
end
