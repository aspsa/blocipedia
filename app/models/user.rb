class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :wikis
  has_many :amounts
  
  after_initialize :init
  
  def admin?
    role == 'admin'
  end
  
  def premium?
    role == 'premium'
  end
  
  def standard?
    role == 'standard'
  end
=begin  
  def account_status?(stat)
    if upgrade
      self.update(role: 'premium')
    else
      self.update(role: 'standard')
    end
  end
=end  
  private
  
    def init
      self.role ||= 'standard'
    end
end