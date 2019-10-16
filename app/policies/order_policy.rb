class OrderPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    user == record.user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
