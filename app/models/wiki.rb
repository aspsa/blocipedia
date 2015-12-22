class Wiki < ActiveRecord::Base
  belongs_to :user
  
  after_initialize :init
  
  def is_private?
    self.private
  end
  
  private
  
    def init
        self.private ||= false
    end
end