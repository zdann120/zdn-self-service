class AddressPolicy < ApplicationPolicy
  def index?
    user
  end

  def show?
    record.user == user
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
  class Scope < Scope
    def resolve
      scope
    end
  end
end