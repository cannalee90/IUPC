class AddGroupIdToSmstrackers < ActiveRecord::Migration
  def change
    add_column :sms_trackers, :group_id, :string
  end
end
