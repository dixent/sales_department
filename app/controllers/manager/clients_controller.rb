class Manager::ClientsController < ManagerController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def show
    @client = find_client
  end

  def create
    @client = Client.new(**client_params)
    if @client.save
      redirect_to manager_clients_url, notice: 'Client added successfully!'
    else
      render :new
    end
  end

  def edit
    @client = find_client
  end

  def update
    @client = find_client
    if @client.update(**client_params)
      redirect_to manager_clients_url, notice: 'Client updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @client = find_client
    @client.destroy

    redirect_to manager_clients_url, notice: 'Client destroyed!'
  end

  private

  def client_params
    params.require(:client).permit(:full_name, :phone)
  end

  def find_client
    Client.find(params[:id])
  end
end
