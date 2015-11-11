class Message < ActiveRecord::Base
    validates :content, length: { maximum: 41 }
end
