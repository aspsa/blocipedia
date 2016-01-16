module WikisHelper
  def wiki_collaboration_link(wiki, user)
    # If this wiki entry does not have a user id in the collaborators table, then this user is a potential collaborator.
    unless wiki.collaborator?(user)
      link_to "Collaborate", add_collaborator_wiki_path(wiki: wiki, user: user.id)
    # If this wiki entry has a user id in the collaborators table, then this user is a candidate for removal as a collaborator.
    else
      link_to "Remove Collaboration", delete_collaborator_wiki_path(wiki: wiki, user: user.id)
    end
  end
  
  def standard_users(users)
    standard_users = []
    
    users.each do |u|
      standard_users << u if u.role == 'standard'
    end
    
    standard_users
  end
end