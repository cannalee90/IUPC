class Participant < ActiveRecord::Base
  belongs_to :team
  has_paper_trail
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_SN_REGEX = /\d{8}/
  VALID_PHONE_REGEX = /\d{11}/
  validates :email, presence: true, uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
  validates :sn, presence: true, uniqueness: true,
                    format: { with: VALID_SN_REGEX }
  validates :phone, presence: true, uniqueness: true,
                    format: { with: VALID_PHONE_REGEX }
  validates :major,
            :majors,
            presence: true

  after_create :send_sms

  has_many :smsTrackers, dependent: :destroy
  has_many :messages, through: :smsTrackers

  def naming
    unless major.nil?
      name + "(#{self.sn})" +" #{major} "
    else
      name + "(#{self.sn})"
    end
  end

  def majors
    %w(기계공학과 항공우주공학과 조선해양공학과 산업경영공학과 화학공학과 생명공학과
       고분자공학과 유기응용재료공학과 신소재공학과 사회인프라공학과 환경공학과 공간정보공학과
       건축공학과 건축학과 에너지자원공학과 융합기술경영학부 전기공학과 전자공학과
       컴퓨터정보공학과 정보통신공학과 수학과 통계학과 물리학과 화학과
       생명과학과 해양과학과 기초의과학부 경제학과 국제통상학과 경영학과 글로벌금융학과
       아태물류학부 국어교육과 영어교육과 사회교육과 교육학과 체육교육과 수학교육과
       법학부 법학 지적재산권학 행정학과 정치외교학과 언론정보학과 한국어문학과
       사학과 철학과 중국언어문화학과 일본언어문화학과 영어영문학과 프랑스언어문화학과
       문화콘텐츠학과 문화경영학과 소비자학과 식품영양학과 아동학과 의류디자인학과
       의예과 간호학과 미술 시각정보 디자인스포츠과학 연극영화)
   end

   def send_sms

     welcome_msg = "IUPC 운영진입니다. #{self.name}님의 등록이 완료되었습니다. 예비소집일은 추후 공지해드리며 불참시 불이익이 있을 수 있습니다."
     coolsend = Coolsms::SendKangho.new( { type: "LMS", subject: "IUPC 운영진입니다."} )
     ret = coolsend.send("01068586821", self.phone, welcome_msg)
     SmsTracker.create(participant_id: self.id, group_id: ret[:group_id], status: -1, message_id: 1)

   end

end
