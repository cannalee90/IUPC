class Post < ActiveRecord::Base
  has_secure_password
  validates :title, :content, :password, :name, presence: true
  has_many :comments, dependent: :destroy
end
