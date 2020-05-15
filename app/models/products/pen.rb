class Products::Pen < ApplicationRecord
  include Productable

  enum form: %i[standard low high]
  enum kernel: %i[m l]

  validates :form, presence: true, uniqueness: { scope: :kernel,
    message: 'Pen with this form and kernel exist!' }
  validates :kernel, presence: true, uniqueness: { scope: :form,
    message: 'Pen with this form and kernel exist!' }

  def attributes_for_select
    "Pen with form: #{form.capitalize} and kernel: #{kernel.capitalize}"
  end
end
