class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :addresses, dependent: :nullify
  has_many :invoices
  has_many :appointments

  validates :first_name, :last_name, presence: true

  enum role: [:guest, :client, :admin]

  def to_s
    email
  end

  def default_address
    Address.find(default_address_id)
  end

  def default_address=(address)
    self.default_address_id = address.id
  end

  private

  def set_default_role
    self.client!
  end
end
