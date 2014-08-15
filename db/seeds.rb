# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user1 = User.create!(uid: "1234", nick: "allen", steam_url: "blah", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif", avatar_full: "http://media.steampowered.com/steamcommunity/public/images/avatars/94/9429f42bd935753f86fa6195977c44b3b4e8201e_full.jpg")
@user1.save!
@user2 = User.create!(uid: "2234", nick: "bob", steam_url: "bleh", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif", avatar_full: "http://media.steampowered.com/steamcommunity/public/images/avatars/94/9429f42bd935753f86fa6195977c44b3b4e8201e_full.jpg")
@user2.save!
# TODO: update this user to me
@user3 = User.create!(uid: "3234", nick: "~{PA}~ Clyph0rd", steam_url: "clyph0rd", avatar: "http://media.steampowered.com/steamcommunity/public/images/avatars/94/9429f42bd935753f86fa6195977c44b3b4e8201e_medium.jpg", avatar_full: "http://media.steampowered.com/steamcommunity/public/images/avatars/94/9429f42bd935753f86fa6195977c44b3b4e8201e_full.jpg")
@user3.save!
@user4 = User.create!(uid: "4234", nick: "dave", steam_url: "bloh", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif", avatar_full: "http://media.steampowered.com/steamcommunity/public/images/avatars/94/9429f42bd935753f86fa6195977c44b3b4e8201e_full.jpg")
@user4.save!
@user5 = User.create!(uid: "5234", nick: "eric", steam_url: "bluh", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif", avatar_full: "http://media.steampowered.com/steamcommunity/public/images/avatars/94/9429f42bd935753f86fa6195977c44b3b4e8201e_full.jpg")
@user5.save!

@player1 = Player.create!(game_type: "Highlander", league_level: "UGC Steel", location: "NA", notes: "i b super pro shpee", user_id: 3, spy: true)
@player1.save!
@player2 = Player.create!(game_type: "Highlander", league_level: "UGC Steel", location: "NA", user_id: 2, soldier: true, scout: true, sniper: true)
@player2.save!
@player3 = Player.create!(game_type: "Highlander", league_level: "UGC Platinum", location: "NA", user_id: 3, soldier: true, medic: true)
@player3.save!
@player4 = Player.create!(game_type: "Highlander", league_level: "UGC Iron", location: "EU", user_id: 4, scout: true, sniper: true)
@player4.save!
@player5 = Player.create!(game_type: "Highlander", league_level: "UGC Steel", location: "EU", user_id: 1, demoman: true, heavy: true)
@player5.save!
@player6 = Player.create!(game_type: "6v6", league_level: "ESEA Invite", location: "NA", user_id: 2, soldier: true)
@player6.save!
@player7 = Player.create!(game_type: "6v6", league_level: "ESEA Open", location: "NA", user_id: 5, soldier: true, scout: true)
@player7.save!
@player8 = Player.create!(game_type: "6v6", league_level: "ESEA Invite", location: "NA", user_id: 3, scout: true)
@player8.save!
@player9 = Player.create!(game_type: "6v6", league_level: "ESEA Invite", location: "NA", user_id: 4, demoman: true)
@player9.save!
@player10 = Player.create!(game_type: "6v6", league_level: "ESEA Open", location: "NA", user_id: 5, medic: true)
@player10.save!
@player11 = Player.create!(game_type: "6v6", league_level: "ETF2L Div6", location: "EU", user_id: 1, demoman: true, soldier: true)
@player11.save!
@player12 = Player.create!(game_type: "6v6", league_level: "ETF2L Div6", location: "EU", user_id: 2, soldier: true, medic: true)
@player12.save!
@player13 = Player.create!(game_type: "6v6", league_level: "ETF2L Div6", location: "EU", user_id: 3, scout: true, medic: true)
@player13.save!
@player14 = Player.create!(game_type: "6v6", league_level: "ETF2L Div1", location: "EU", user_id: 4, soldier: true)
@player14.save!
@player15 = Player.create!(game_type: "6v6", league_level: "ETF2L Div4", location: "EU", user_id: 5, demoman: true, medic: true)
@player15.save!
@player16 = Player.create!(game_type: "6v6", league_level: "ETF2L Div3", location: "EU", user_id: 1, soldier: true, scout: true)
@player16.save!

@review1 = Review.create!(body: "This guy is soooooooo terrible at spy :P", user_id: 4, player_id: 1)
@review1.save!
@review2 = Review.create!(body: "True pro, pick him up quick", user_id: 3, player_id: 1)
@review2.save!

@team1 = Team.create!(name: "bballerz", tag: ">bb<", game_type: "Highlander", league_level: "UGC Gold", location: "NA", user_id: 5, spy: true)
@team1.save!
@team2 = Team.create!(name: "goingHAM", tag: "H4M", game_type: "Highlander", league_level: "UGC Silver", location: "EU", user_id: 1, scout: true, demoman: true, heavy: true, engineer: true)
@team2.save!
@team3 = Team.create!(name: "spy crabz", tag: "spai", game_type: "Highlander", league_level: "UGC Iron", location: "EU", user_id: 2, engineer: true, soldier: true)
@team3.save!
@team4 = Team.create!(name: "deathMachine", tag: "dm.", game_type: "Highlander", league_level: "UGC Silver", location: "NA", user_id: 3, scout: true)
@team4.save!
@team5 = Team.create!(name: "team", tag: "t", game_type: "Highlander", league_level: "UGC Platinum", location: "NA", user_id: 4, demoman: true)
@team5.save!
@team6 = Team.create!(name: "blahdf", tag: "bla", game_type: "Highlander", league_level: "UGC Iron", location: "NA", user_id: 5, medic: true, heavy: true)
@team6.save!
@team7 = Team.create!(name: "asldf", tag: "asl", game_type: "Highlander", league_level: "UGC Iron", location: "EU", user_id: 1, scout: true)
@team7.save!
@team8 = Team.create!(name: "team8", tag: "8", game_type: "6v6", league_level: "ETF2L Div5", location: "EU", user_id: 2, scout: true, demoman: true)
@team8.save!
@team9 = Team.create!(name: "qrvajogisd", tag: "qrva", game_type: "6v6", league_level: "ETF2L Div6", location: "EU", user_id: 3, demoman: true)
@team9.save!
@team10 = Team.create!(name: "lkfjnc", tag: "lkf", game_type: "6v6", league_level: "ETF2L Div6", location: "EU", user_id: 4, medic: true)
@team10.save!
@team11 = Team.create!(name: "LDFJSFL", tag: "LDF", game_type: "6v6", league_level: "ETF2L Div5", location: "EU", user_id: 5, demoman: true)
@team11.save!
@team12 = Team.create!(name: "xzczcvv", tag: "asdf", game_type: "6v6", league_level: "ESEA Invite", location: "NA", user_id: 1, scout: true)
@team12.save!
@team13 = Team.create!(name: "The Incredibles", tag: "Inc.", game_type: "6v6", league_level: "ETF2L Div2", location: "EU", user_id: 2, medic: true)
@team13.save!
@team14 = Team.create!(name: "teh expenables", tag: "X", game_type: "6v6", league_level: "ESEA Invite", location: "NA", user_id: 3, demoman: true)
@team14.save!
@team15 = Team.create!(name: "sdlfjv", tag: "vcx", game_type: "6v6", league_level: "ESEA Open", location: "NA", user_id: 4, scout: true, soldier: true)
@team15.save!
