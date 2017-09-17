require "administrate/base_dashboard"

class LineItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    itemable: Field::Polymorphic,
    id: Field::Number,
    title: Field::String,
    quantity: Field::Number,
    unit_of_measure: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    unit_price_cents: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :itemable,
    :id,
    :title,
    :quantity,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :itemable,
    :id,
    :title,
    :quantity,
    :unit_of_measure,
    :created_at,
    :updated_at,
    :unit_price_cents,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :itemable,
    :title,
    :quantity,
    :unit_of_measure,
    :unit_price_cents,
  ].freeze

  # Overwrite this method to customize how line items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(line_item)
  #   "LineItem ##{line_item.id}"
  # end
end
