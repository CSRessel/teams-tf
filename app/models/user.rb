class User < ActiveRecord::Base
  before_create :create_remember_token
  before_destroy :destroy_players_teams_reviews

  has_many :teams
  has_many :players
  has_many :reviews

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

    def destroy_players_teams_reviews
      self.players.each do |p|
        p.destroy
      end
      self.teams.each do |t|
        t.destroy
      end
      self.reviews.each do |r|
        r.destroy
      end
    end
end
