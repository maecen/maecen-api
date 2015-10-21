class ProjectPolicy < ApplicationPolicy
  def show?
    Subscription.where(user_id: user.id, project_id: record.id).present?
  end

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