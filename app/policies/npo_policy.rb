class NpoPolicy < ApplicationPolicy

  def index?
    true
  end
  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    #should have and admin that can edit it
    true

  end

  def update?
   #should have an admin
    true

  end


  def destroy?
    #should have an admin
    true
    # true
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
