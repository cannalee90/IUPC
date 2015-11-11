class TeamlistController < ApplicationController
  require 'coolsms'
  before_action :authenticate_user!
  def index
    @teams = Team.all
  end
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(messages_params)
    respond_to do |format|
      if @message.save
        flash[:success] = "문자가 성공적으로 저장되었습니다."
        format.html { redirect_to '/teamlist/index'}
      else
        flash[:error] = "문자가 너무 길어요 80byte 이내여야 합니다."
        format.html { render :new}
        format.json { render json: @post.errors }
      end
    end      
  end
  
  def sendmessage
    @receiverlist = params[:list] || []
    @participants = Participant.all
    @message = Message.find(params[:message_id][:id])
    
    if(send_status() > @receiverlist.count)
      @receiverlist.each do |receiver|  
        puts send_sms(@message.content, @participants.find(receiver).phone) 
      end
      flash[:success] = @receiverlist.count.to_s + "명에게 문자를 보냈습니다"
      redirect_to '/teamlist/selectsender'
    else
      flash[:error] = "잔액이 부족합니다 책임자에게 연락하세요"
      puts send_sms("잔액이 부족합니다 책임자에게 연락하세요", "01026772637") 
      redirect_to '/teamlist/selectsender'
    end
  end
  

  def selectsender
   @participants = Participant.all
  end
  
private
  def messages_params
    params.require(:message).permit(:title, :content)
  end
  
  def send_status()
    coolsms_balance = Coolsms::SMS::Balance.new
    coolsms_balance.balance[:message]["cash"].to_i / 20
  end  
  
  def send_sms(content, receiver)
    coolsend = Coolsms::SMS::Send.new( {} )
    coolsend.send("01026772637", receiver, content)
  end  
  
end