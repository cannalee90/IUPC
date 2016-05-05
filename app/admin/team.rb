ActiveAdmin.register Team do

  collection_action "sms", :method=>:get, action: :sms do
  end
  collection_action "sending", :method=>:post, action: :sending do
  end


  controller do
    def sms
      @participants = Participant.all
    end

    def sending
      @receivers = Participant.find(params[:collection_selection] || [])
      @message = Message.find(params[:message][:message_id])
      if sendable(@receivers)
        @receivers.each { |receiver| send_sms(receiver, @message) }
        flash[:notice] = @receivers.size.to_s + "명에게 문자를 보냈습니다"
      else
        flash[:error] = "잔액이 부족합니다 책임자에게 연락하세요"
      end
      redirect_to :back
    end

    private
    def sendable(receivers)
      ret = $COOLSMS_BALANCE.balance
      true if (ret[:message]["cash"].to_i >= (receivers.size * 50))
    end

    def send_sms(receiver, message)
      coolsend = Coolsms::SendKangho.new( { type: "LMS", subject: "IUPC 운영진입니다."} )
      ret = coolsend.send("01068586821", receiver.phone, message.content)
      puts ret
      SmsTracker.create(participant_id: receiver.id, message_id: message.id, group_id: ret[:group_id], status: -1)
    end
  end

  permit_params :name



end
