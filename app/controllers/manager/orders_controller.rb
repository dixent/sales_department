class Manager::OrdersController < ManagerController
  def index
    @orders = Order.order(id: :desc).includes(:client, product_sets: { product: :productable })

    if params[:status]
      @orders = @orders.where(status: params[:status])
    else
      @orders = @orders.where.not(status: :closed)
    end

    if params[:search_by_date]
      @orders = @orders.where(date_of_saling: Date.parse(params[:search_by_date]))
    end
  end

  def new
    @order = Order.new
    @products = init_products
    @clients = init_clients
  end

  def create
    @order = Order.new(order_params)
    @clients = init_clients

    if @order.save
      redirect_to manager_orders_url
    else
      @products = init_products
      @clients = init_clients

      flash[:alert] = 'Please add products!' if @order.product_sets.blank?
      error_product_sets = @order.errors[:product_sets].first
      flash[:alert] = error_product_sets if error_product_sets
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

    ActiveRecord::Base.transaction do
      prev_status = @order.status
      unless @order.opened?
        if @order.update(status: params[:status])
          UpdateAvailableProducts.new(order: @order).call
        else
          flash['alert'] = 'Status invalid!'
        end
      else
        @order.update(status: params[:status])
      end

      if @order.closed? && prev_status == 'reserved'
        @order.product_sets.includes(:product).each do |product_set|
          product = product_set.product
          product.update(sold: product.sold.to_i + product_set.number,
                         in_stock: product.in_stock.to_i - product_set.number)
        end
      end
    end

    redirect_back(fallback_location: manager_orders_url)
  rescue ActiveRecord::RecordInvalid => e
    flash['alert'] = e.message
    redirect_back(fallback_location: manager_orders_url)
  end

  def destroy
    @order = find_order

    @order.destroy

    redirect_to manager_orders_url
  end

  private

  def order_params
    params.require(:order).permit(:'date_of_saling(1i)', :lng, :lat, :client_id,
                                  :'date_of_saling(2i)', :'date_of_saling(3i)',
                                  product_sets_attributes:
                                    [:product_id, :number, :_destroy])
  end

  def find_order
    Order.find(params[:id])
  end

  def init_products
    Product.all.includes(:productable).each_with_object({}) do |product, hash|
      hash[product.productable.attributes_for_select] = product.id
    end
  end

  def init_clients
    Client.all.each_with_object({}) do |client, hash|
      hash[client.attributes_for_select] = client.id
    end
  end
end
