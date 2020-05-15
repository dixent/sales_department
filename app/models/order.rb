class Order < ApplicationRecord
  has_many :product_sets
  belongs_to :client

  validates :product_sets, presence: true
  validates :date_of_saling, presence: true
  validate do |order|
    unless order.date_of_saling > DateTime.current.to_date
      order.errors.add(:date_of_saling, 'Date should be greater now!')
    end
  end

  validate do |order|
    product_ids = order.product_sets.flat_map(&:product_id)

    if product_ids != product_ids.uniq
      order.errors.add(:product_sets, "Please don't use the same products!")
    end
  end

  enum status: %i[opened unreserved reserved closed]

  accepts_nested_attributes_for :product_sets, reject_if: :all_blank, allow_destroy: true
end
