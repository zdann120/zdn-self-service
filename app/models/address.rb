class Address < ApplicationRecord
  before_create :set_verification_code
  after_create :set_default_if_first_address
  after_create :verify
  belongs_to :user
  has_secure_token

  validates :line1, :city, :state, :zip, presence: true

  def to_s
    nickname
  end

  def verify
    return false unless verification_result.blank?
    smarty_streets_verify
  end

  def verified?
    !verification_result.blank? && verification_result['analysis']['active'] == "Y"
  end

  def validated_address
    comps = verification_result['components']
    addr1 = [comps['primary_number'], comps['street_predirection'], comps['street_name'], comps['street_suffix'],
             comps['secondary_designator'], comps['secondary_number']].join(' ')
    zip_plus_four = [comps['zipcode'], comps['plus4_code']].join('-')
    final = [comps['city_name'], comps['state_abbreviation'], zip_plus_four].join(', ')
    [addr1, final].join(" \n")
  end

  private

  def smarty_streets_verify
    result = SmartyStreets::StreetAddressApi.call(
      SmartyStreets::StreetAddressRequest.new(
        input_id: self.id.to_s,
        street: line1,
        street2: line2,
        city: city,
        state: state,
        zip: zip,
        addressee: [user.first_name, user.last_name].join(' ')
      )
    ).first.to_hash

    self.update(verification_result: result)

    result
  end

  def set_default_if_first_address
    if user.addresses.count == 1
      user.default_address = self
      user.save!
    end
  end

  def set_verification_code
    self.verification_code = loop do
      ulid = ULID.generate
      break ulid unless Address.exists?(verification_code: ulid)
    end
  end

  
end
