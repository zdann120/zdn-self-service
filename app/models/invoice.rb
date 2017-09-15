class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_secure_token

  has_many :line_items, as: :itemable
  accepts_nested_attributes_for :line_items, allow_destroy: true, reject_if: :all_blank

  validates :indentifier, :send_date, :due_date, presence: true
end
