class User < ActiveRecord::Base
  
  validates :username, :password, presence: true
  validates :password, length: { minimum: 6 }
  
  def reset_token!
    self.token = SecureRandom.urlsafe_base64(16)
    self.save
    self.token
  end
end
