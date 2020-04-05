class Event < ApplicationRecord
  enum operation_type: %i[buy increase]
  belongs_to :subject, polymorphic: true
end
