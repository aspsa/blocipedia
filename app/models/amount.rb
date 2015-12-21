class Amount < ActiveRecord::Base
  belongs_to :user
  
  def default
    10_00
  end
end