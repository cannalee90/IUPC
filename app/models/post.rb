class Post < ActiveRecord::Base
  has_secure_password
  validates :title, presence: true
  validates :content, presence: true
  validates :password, presence: true
  validates :name, presence: true
  has_many :comments
end
