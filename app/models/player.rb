class Player < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :game_type, presence: true, inclusion: { in %w(6v6 highlander) }
  validates :league,    presence: true, inclusion: { in %w(UGC ESEA ETF2L) }
  validates :level,     presence: true, inclusion: { in %w(iron steel silver gold platinum) },  if: :is_UGC?
  validates :level,     presence: true, inclusion: { in %w(open invite) },                      if: :is_ESEA?
  validates :level,     presence: true, inclusion: { in %w(div1 div2 div3 div4 div5 div6) },    if: :is_ETF2L?
  validates :user_id,   presence: true
  validate  :has_class?

  def is_UGC?
    game_type == "UGC"
  end

  def is_ESEA?
    game_type == "ESEA"
  end

  def is_ETF2L?
    game_type == "ETF2L"
  end

  def has_class?
    scout or soldier or pyro or demoman or heavy or engineer or medic or sniper or spy
  end
end
