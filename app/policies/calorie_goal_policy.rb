class CalorieGoalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def show_goal?
    true
  end

  def create?
    true
  end
end
