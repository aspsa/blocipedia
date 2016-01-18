class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  
  after_initialize :init
  
  def is_private?
    self.private
  end
  
  def collaborator?(user)
    self.collaborators.find_by(user_id: user)
  end
  
  def user_collaborators
    users = []
    collaborators = Collaborator.includes(:user).where(wiki_id: self).all

    collaborators.each do |collaborator|
      users.push(collaborator.user)
    end
    
    users
  end
  
  private
  
    def init
      self.private ||= false
    end
end