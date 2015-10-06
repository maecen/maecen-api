class ProjectPolicy < ApplicationPolicy
  def create?
    user.creative?
  end
end