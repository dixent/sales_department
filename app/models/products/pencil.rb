class Products::Pencil < ApplicationRecord
  include Productable

  enum form: %i[big small]
  enum color: %i[white black red]

  validates :form, presence: true, uniqueness: { scope: :color,
    message: 'Pencil with this form and color exist!' }
  validates :color, presence: true, uniqueness: { scope: :form,
    message: 'Pencil with this form and color exist!' }

  def attributes_for_select
    "Pencil with form: #{form.capitalize} and color: #{color.capitalize}"
  end
end
