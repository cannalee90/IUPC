class Team < ActiveRecord::Base
  has_many :participants
  accepts_nested_attributes_for :participants
  validates_associated :participants
  VALID_NAME_REGEX = /[\w\-_\s]+/
  validates :name,  presence: true, 
                    length: { maximum: 30 },
                    format: { with: VALID_NAME_REGEX }, 
                    uniqueness: true
  validate :sameness
  def sameness
    if self.participants.first.sn == self.participants.second.sn || self.participants.second.sn == self.participants.third.sn || self.participants.first.sn == self.participants.third.sn
      errors[:base] << "잘못된 정보가 있습니다."
    end
    if self.participants.first.email == self.participants.second.email || self.participants.second.email == self.participants.third.email || self.participants.first.email == self.participants.third.email
      errors[:base] << "잘못된 정보가 있습니다."
    end
    if self.participants.first.phone == self.participants.second.phone || self.participants.second.phone == self.participants.third.phone || self.participants.first.phone == self.participants.third.phone
      errors[:base] << "잘못된 정보가 있습니다."
    end  
  end
end
