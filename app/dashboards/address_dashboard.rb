require "administrate/base_dashboard"

class AddressDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    token: Field::String,
    nickname: Field::String,
    line1: Field::String,
    line2: Field::String,
    city: Field::String,
    state: Field::String,
    zip: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    phone_number: Field::String,
    verification_code: Field::String,
    verified: Field::Boolean,
    verification_result: ::JsonField,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :nickname,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :token,
    :nickname,
    :line1,
    :line2,
    :city,
    :state,
    :zip,
    :phone_number,
    :verification_code,
    :verification_result,
    :verified,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :nickname,
    :line1,
    :line2,
    :city,
    :state,
    :zip,
    :phone_number,
    :verified,
  ].freeze

  # Overwrite this method to customize how addresses are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(address)
    address.nickname
  end
end
