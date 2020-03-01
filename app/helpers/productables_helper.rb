module ProductablesHelper
  def create_manager_productable_path(productable)
    send("manager_products_#{productable.type.downcase}s_path")
  end

  def manager_productable_path(productable)
    send("manager_products_#{productable.type.downcase}_path", productable)
  end

  def new_manager_productable_path(product_name)
    send("new_manager_products_#{product_name.downcase}_path")
  end

  def edit_manager_productable_path(productable)
    send("edit_manager_products_#{productable.type.downcase}_path", productable)
  end

  def create_update_productable_path(productable)
    if action_name == 'new'
      create_manager_productable_path(productable)
    else
      manager_productable_path(productable)
    end
  end
end
