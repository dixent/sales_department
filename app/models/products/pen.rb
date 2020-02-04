class Products::Pen < Product
  enum form: %i[standard low high]
  enum kernel: %i[m l]

  has_one :product_set
end
