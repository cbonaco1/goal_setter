class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { miniumum: 6, allow_nil: true }

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.new(password)
  end

end
