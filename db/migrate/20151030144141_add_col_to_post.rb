class AddColToPost < ActiveRecord::Migration
  def change
    add_column :posts, :name, :string
    add_column :posts, :email, :string
    add_column :posts, :password, :string
  end
end
