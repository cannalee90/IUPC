class TeamlistController < ApplicationController
  before_action :authenticate_user!
  def index
    @teams = Team.all
  end

  def sendtest
  end

  def testing
  end

  def sendmessage
  end


  def selectsender
    @participants = Participant.all
    cool_sent = Coolsms::SMS::Sent.new(count: "100000")
    @ret_hash = Hash.new
    @ret_hash = cool_sent.sent[:message]["data"]
  end

private
  def messages_params
    params.require(:message).permit(:title, :content)
  end

  def send_status()
    coolsms_balance = Coolsms::SMS::Balance.new
    coolsms_balance.balance[:message]["cash"].to_i / 40
  end

  def send_sms(content, receiver)
    coolsend = Coolsms::SendKangho.new( { type: "LMS", subject: "IUPC 운영진입니다."} )
    coolsend.send("01026772637", "01026772637", "hihi")
  end

end
