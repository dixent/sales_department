class Products::Pencil < ApplicationRecord
  include Productable

  enum form: %i[big small]
  enum color: %i[white black red]

  def attributes_for_select
    "form: #{form} | color: #{color}"
  end
end
