class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki
  
  validates :wiki, uniqueness: { scope: :user }
end