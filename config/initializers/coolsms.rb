$COOLSMS_SEND = Coolsms::SMS::Send.new({
  type: "LMS",
  subject: "IUPC 운영진입니다"
})
$COOLSMS_BALANCE = Coolsms::SMS::Balance.new
$COOLSMS_STATUS = Coolsms::SMS::Status.new()
$COOLSMS_SENT = Coolsms::SMS::Sent.new()
