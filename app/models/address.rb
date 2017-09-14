class Address < ApplicationRecord
  after_create :set_default_if_first_address
  belongs_to :user
  has_secure_token

  private

  def set_default_if_first_address
    if user.addresses.count == 1
      user.default_address = self
      user.save!
    end
  end
end
