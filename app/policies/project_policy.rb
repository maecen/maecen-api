class ProjectPolicy < ApplicationPolicy
  def create?
    true
  end
  def update?
    record.creatives.include?(user)
  end

  def destroy?
    record.creatives.include?(user)
  end
end
