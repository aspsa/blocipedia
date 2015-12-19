class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :wikis
  
  # Can create/edit/delete any user's wiki entries.
  def admin?
    role == 'admin'
  end
  
  # Can delete but not edit any user's wiki entries.
  def moderator?
    role == 'moderator'
  end
  
  # Can create/edit/delete one's own wiki entries.
  def member?
    role == 'member'
  end
  
  # Can only view other users' public wiki entries.
  def guest?
    role == 'guest'
  end
end
