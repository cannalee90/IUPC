class Coolsms::SendKangho < Coolsms::SMS::Send
  def send(from, to, text)
    fields = self.fields( :type, :charset, :datetime, :delay, :refname, :country, :subject, :srk, :mode, :extension, :force_sms )
    fields = fields.merge(from: from, to: to, text: text, type: self.type )
    res = Request.new.post( "send", fields )

    if res.code == "200"
      body = JSON.parse(res.body)
      {
        ret: body['result_code'] == "00",
        message: body['result_message'],
        code: res.code,
        message_id: body['message_id'],
        group_id: body['group_id']
       }
    else
      {
        ret: false,
        code: res.code
       }
    end
  end
end
