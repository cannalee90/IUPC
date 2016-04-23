class Announce < ActiveRecord::Base
  validates :title, :content, presence: true  
end
