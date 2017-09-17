class Invoice < ApplicationRecord
  before_create :set_ulid
  belongs_to :user
  belongs_to :address
  has_secure_token

  has_many :line_items, as: :itemable
  accepts_nested_attributes_for :line_items, allow_destroy: true, reject_if: :all_blank

  validates :identifier, :send_date, :due_date, presence: true

  def update_ulid
    set_ulid
    save
  end

  private

  def set_ulid
    self.unique_code = loop do
      ulid = ULID.generate
      break ulid unless Invoice.exists?(unique_code: ulid)
    end
  end
end
