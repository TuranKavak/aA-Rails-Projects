class User < ApplicationRecord
  # extend FriendlyId
  # friendly_id :username, use: :slugged
  
  validates :session_token, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: { message: 'Password can\'t be blank.' }

  attr_reader :password

  has_many :subs,
    class_name: :Sub,
    foreign_key: :moderator_id,
    primary_key: :id,
    inverse_of: :moderator

  has_many :posts, inverse_of: :author
  has_many :comments, inverse_of: :author
  has_many :user_votes, inverse_of: :user

  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(32)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token

    while User.exists?(session_token: self.session_token)
      self.session_token = self.class.generate_session_token
    end
    self.save!

    self.session_token
  end

  def is_password?(maybe_password)
    BCrypt::Password.new(self.password_digest).is_password?(maybe_password)
  end

  def password=(new_pw)
    @password = new_pw
    self.password_digest = BCrypt::Password.create(new_pw)
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
