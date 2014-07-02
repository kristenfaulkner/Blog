class Post < ActiveRecord::Base
  
  validates :title, :user_id, :body, presence: true
  
  has_many :tags
end
