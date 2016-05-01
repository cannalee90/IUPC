 task whenever: :environment do
   trackers = SmsTracker.where(status: -1)
   trackers.each do |tracker|
     sent = Coolsms::SMS::Sent.new(gid: tracker.group_id )
     ret = sent.sent[:message]["data"][0]["result_code"]
     tracker.update(status: ret.to_i)
   end
 end

 task daily_notice: :environment do
   ret = $COOLSMS_BALANCE.balance
   $COOLSMS_SEND.send("01026772637", "01026772637", "#{ret[:message]['cash']}의 비용이 남았습니다.")
 end
