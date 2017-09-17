class AddressPolicy < ApplicationPolicy
  def index?
    user
  end

  def show?
    (record.user == user) || user.admin?
  end

  def show_verification_result?
    user.admin?
  end

  def update?
    false
  end

  def destroy?
    record.user == user
  end

  def create?
    true
  end

  def populate_address_list?
    user.try(:admin?)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
