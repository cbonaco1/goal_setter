class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :goals
  
  has_many :user_comments

  has_many(
    :authored_user_comments,
    class_name: 'UserComment',
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :authored_goal_comments,
    class_name: 'GoalComment',
    foreign_key: :author_id,
    primary_key: :id
  )

  attr_reader :password
  after_initialize :ensure_session_token

  def self.validate_credentials(username, password)
    user = User.find_by_username(username)

    if user
      user.is_password?(password) ? user : nil
    else
      nil
    end
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save
    self.session_token
  end


  private
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end
