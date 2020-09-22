class ProductPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def owned?
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
      # here return products that haven't been purchased
      # instead of returning .all of them
      scope.all
    end
  end
end
