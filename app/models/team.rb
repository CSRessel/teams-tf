class Team < ActiveRecord::Base
  belongs_to :user

  validates :name,          presence: true, uniqueness: true
  validates :game_type,     presence: true, inclusion: { in: %w(6v6 highlander) }
  #validates :league,       presence: true, inclusion: { in: %w(UGC ESEA ETF2L) }
  #validates :league,       presence: true, inclusion: { in: %w(ESEA ETF2L) },                       if: :is_6v6?
  #validates :level,        presence: true, inclusion: { in: %w(iron steel silver gold platinum) },  if: :is_UGC?
  #validates :level,        presence: true, inclusion: { in: %w(open invite) },                      if: :is_ESEA?
  #validates :level,        presence: true, inclusion: { in: %w(div1 div2 div3 div4 div5 div6) },    if: :is_ETF2L?
  validates :league_level,  presence: true, inclusion: { in: ["UGC Iron", "UGC Steel", "UGC Silver", "UGC Gold", "UGC Platinum", "ESEA Open", "ESEA Invite", "ETF2L Div6", "ETF2L Div5", "ETF2L Div4", "ETF2L Div3", "ETF2L Div2", "ETF2L Div1"] }
  validates :notes, length: { maximum: 140 }
  validates :location,      presence: true, inclusion: { in: %w(NA EU) }
  validates :user_id,       presence: true
  validate  :has_class?

  #def is_highlander?
    #game_type == "highlander"
  #end

  #def is_6v6?
    #game_type == "6v6"
  #end

  #def is_UGC?
    #league == "UGC"
  #end

  #def is_ESEA?
    #league == "ESEA"
  #end

  #def is_ETF2L?
    #league == "ETF2L"
  #end

  def has_class?
    scout or soldier or pyro or demoman or heavy or engineer or medic or sniper or spy
  end
end
