class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :addresses, dependent: :nullify

  validates :first_name, :last_name, presence: true

  def default_address
    Address.find(default_address_id)
  end

  def default_address=(address)
    self.default_address_id = address.id
  end
end
