require "administrate/field/base"

class JsonField < Administrate::Field::Base
  def to_s
    data
  end
end
