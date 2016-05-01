class CreateSmsTrackers < ActiveRecord::Migration
  def change
    create_table :sms_trackers do |t|
      t.references :participant, index: true, foreign_key: true
      t.references :message, index: true, foreign_key: true
      t.string :group_id
      t.integer :status
      t.timestamps null: false
    end
  end
end
