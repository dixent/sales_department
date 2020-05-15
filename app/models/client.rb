class Client < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :full_name, presence: true
  validates :phone, length: { is: 12 }, uniqueness: true
  validate do |client|
    Integer(client.phone)
  rescue ArgumentError
    client.errors.add(:phone, 'Not valid number!')
  end

  def attributes_for_select
    "Name: #{full_name} | Phone: +#{phone}"
  end
end
