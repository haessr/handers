class ReviewPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end


  def update?
    # record == @product
    # user == current_user
    # record.user == @user || record.product.user == @user
    true
  end


  def destroy?
    # record == @product
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
