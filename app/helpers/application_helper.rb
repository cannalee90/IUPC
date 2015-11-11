module ApplicationHelper
  require 'json'
  def get_balance()
    coolsms_balance = Coolsms::SMS::Balance.new
    coolsms_balance.balance[:message]["cash"]
  end  
  
  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "alert-success"   # Green
    when "error"
      "alert-danger"    # Red
    when "alert"
      "alert-warning"   # Yellow
    when "notice"
      "alert-info"      # Blue
    else
      flash_type.to_s
    end
  end
end
