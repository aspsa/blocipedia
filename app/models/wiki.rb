class Wiki < ActiveRecord::Base
  belongs_to :user
  
  after_initialize :init
  
  private
  
    def init
        self.private ||= false
    end
end