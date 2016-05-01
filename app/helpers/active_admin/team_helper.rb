module ActiveAdmin::TeamHelper

  def labeling (status)
    message = sms_status (status)
    color = sms_class (status)
    content_tag(:span, class: "status_tag active #{color}" ) do
      message
    end
  end

  def sms_status(status)
    case status
    when 00
      "정상"
    when 10
      "잘못된 번호"
    when 11
      "상위 서비스망 스팸 인식됨"
    when 12
      "상위 서버 오류"
    when 13
      "잘못된 필드값"
    when 20
      "등록된 계정이 아니거나 패스워드가 틀림"
    when 21
      "존재하지 않는 메시지 ID"
    when 30
      "가능한 전송 잔량이 없음"
    when 31
      "전송할 수 없음"
    when 32
      "가입자 없음"
    when 40
      "전송시간 초과"
    when 41
      "단말기 busy"
    when 42
      "음영지역"
    when 43
      "단말기 Power off"
    when 44
      "단말기 메시지 저장갯수 초과"
    when 45
      "단말기 일시 서비스 정지"
    when 46
      "기타 단말기 문제"
    when 47
      "착신거절"
    when 48
      "Unkown error"
    when 49
      "Format Error"
    when 50
      "SMS서비스 불가 단말기"
    when 51
      "착신측의 호불가 상태"
    when 52
      "이통사 서버 운영자 삭제"
    when 53
      "서버 메시지 Que Full"
    when 54
      "SPAM"
    when 55
      "SPAM, nospam.or.kr 에 등록된 번호"
    when 56
      "전송실패(무선망단)"
    when 57
      "전송실패(무선망->단말기단)"
    when 58
      "전송경로 없음"
    when 60
      "예약취소"
    when 70
      "허가되지 않은 IP주소"
    when 81
      "게이트웨이 연결 실패"
    when 82
      "이미지 미입력"
    when 83
      "수신번호 미입력"
    when 84
      "발신번호 미입력"
    when 85
      "메시지 내용 미입력"
    when 86
      "미지원 이미지 타입"
    when 99
      "전송대기"
    else
      "대기중"
    end
  end

  def sms_class (status)
    case status
    when 00
      "ok"
    when -1
      "progress"
    else
      "error"
    end
  end



end
