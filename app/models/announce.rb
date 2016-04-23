class Announce < ActiveRecord::Base
  validates :title, :content, presence: true
  def name
    "운영진"
  end
end
