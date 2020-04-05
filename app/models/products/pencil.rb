class Products::Pencil < ApplicationRecord
  include Productable

  enum form: %i[big small]
  enum color: %i[white black red]

  def attributes_for_select
    "Pencil with form: #{form.capitalize} and color: #{color.capitalize}"
  end
end
