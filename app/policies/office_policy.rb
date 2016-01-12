class OfficePolicy < ApplicationPolicy

  def create?
    user.present? && user.admin?
  end

  def new?
    create?
  end

  def update?
    user.present? && user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

end
