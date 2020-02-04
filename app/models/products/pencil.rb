class Products::Pencil < Product
  enum form: %i[big small]
  enum color: %i[white black red]
end
