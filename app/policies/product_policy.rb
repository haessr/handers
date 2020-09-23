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
      # when order is accepted -> the product.sold becomes true
      # so that we can filter by scope.where.not(sold: true)

      # here return products that haven't been purchased
      # instead of returning .all of them
      scope.where.not(sold: true)
    end
  end
end
