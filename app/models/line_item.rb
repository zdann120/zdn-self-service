class LineItem < ApplicationRecord
  belongs_to :itemable, polymorphic: true
  monetize :unit_price_cents
end
