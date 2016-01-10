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
  
  private
  
    def init
      self.private ||= false
    end
end