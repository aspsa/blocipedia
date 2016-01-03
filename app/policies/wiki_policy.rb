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
#   Can view other users' public wiki entries.
#   Can create public wiki entries but not private wiki entries.

class WikiPolicy < ApplicationPolicy
  def create?
    user.present? && ((user.standard? && !record.private) || !user.standard?)
  end

  def create_private?
    !user.standard?
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

  class Scope
    attr_reader :user, :scope
    
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    
    def resolve
      wikis = []
      
      if user.role == 'admin'
        wikis = scope.all   # If this is an admin, show all wikis
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.public? || wiki.user == user || wiki.users.include?(user)
            wikis << wiki   # If the user has a premium membership, show all
                            #   public wikis, all his private wikis or all
                            #   private wikis in which he is a collaborator
          end
        end
      else # Standard membership
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if wiki.public? || wiki.users.include?(user)
            wikis << wiki   # If the user has a standard membership, show all
                            #   public wikis or all private wikis in which he is
                            #   a collaborator
          end
        end
      end
      
      wikis   # Return the wikis array
    end
  end
end