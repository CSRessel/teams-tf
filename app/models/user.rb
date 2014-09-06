class User < ActiveRecord::Base
  before_create :create_remember_token

  has_many :teams,    :dependent => :destroy
  has_many :players,  :dependent => :destroy
  has_many :reviews,  :dependent => :destroy

  validates :uid,         presence: true, uniqueness: true
  validates :nick,        presence: true
  validates :steam_url,   presence: true, uniqueness: true
  validates :avatar,      presence: true
  validates :avatar_full, presence: true

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
