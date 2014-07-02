class Comment < ActiveRecord::Base
  validates :body, :link_id, presence: true
  
  belongs_to :link
end
