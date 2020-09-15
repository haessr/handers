class ProductPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    true
  end


  def edit?
    # record == @restaurant
    # user == current_user
    record.user == user
    # true
  end

  def update?
    # record == @restaurant
    # user == current_user
    record.user == user
    # true
  end


  def destroy?
    # record == @restaurant
    # user == current_user
    record.user == user
    # true
  end


  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
