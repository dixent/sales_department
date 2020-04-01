class Products::Pen < ApplicationRecord
  include Productable

  enum form: %i[standard low high]
  enum kernel: %i[m l]

  def attributes_for_select
    "form: #{form} | kernel: #{kernel}"
  end
end
