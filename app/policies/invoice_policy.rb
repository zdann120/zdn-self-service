class InvoicePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.user == user || user.admin?
  end

  def update?
    user.admin?
  end

  def create?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
