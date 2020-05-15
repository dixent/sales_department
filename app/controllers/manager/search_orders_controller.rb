class Manager::SearchOrdersController < ManagerController
  def create
    date_in_numbers = SearchByDate.new(query: query).call

    if date_in_numbers.is_a? Hash
      redirect_to manager_orders_url(status: params[:status]), alert: date_in_numbers[:error]
      return
    end

    redirect_to manager_orders_url(search_by_date: date_in_numbers, status: params[:status])
  end

  private

  def query
    @query ||= params[:search][:query]
  end
end
