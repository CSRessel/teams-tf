class User < ActiveRecord::Base
  has_many :teams
  has_many :players
  has_many :reviews

  validates :nick,  presence: true
  validates :profile, presence: true
  validates :avatar, presence: true
end
