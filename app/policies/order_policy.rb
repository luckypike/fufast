class OrderPolicy < ApplicationPolicy
  def index?
    user
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
