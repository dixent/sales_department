class Products::Pencil < ApplicationRecord
  include Productable

  enum form: %i[big small]
  enum color: %i[white black red]
end
