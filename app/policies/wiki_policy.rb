# Admin:
#   Can create/edit/delete one's own private/public wiki entries.
#   Can view all private/public wiki entries.
#   Can edit all public wiki entries.
#   Cannot edit other users' private wiki entries.
#   Can delete other users' private/public wikis entries.
#
# Premium:
#   Can create/edit/delete one's own private/public wiki entries.
#   Can view all public wiki entries.
#   Cannot view any users' private wiki entries.
#   Can edit all public wiki entries.
#   Cannot delete other users' public wiki entries.
#
# Standard:
#   Can only view other users' public wiki entries.

class WikiPolicy < ApplicationPolicy
  def create?
    user.present? && !user.standard?
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    update? && !user.standard?
  end
end