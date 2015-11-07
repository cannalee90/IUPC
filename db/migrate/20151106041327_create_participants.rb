class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :sn
      t.string :role

      t.timestamps null: false
    end
  end
end
