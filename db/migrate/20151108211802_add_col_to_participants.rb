class AddColToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :major, :string
  end
end
