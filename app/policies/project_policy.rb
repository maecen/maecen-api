class ProjectPolicy < ApplicationPolicy
  def create?
    user.creative?
  end

  def update?
    user.creative? and record.creatives.include?(user)
  end

  def destroy?
    user.creative? and record.creatives.include?(user)
  end
end