# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user1 = User.create!(uid: "1234", nick: "allen", steam_url: "blah", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif")
@user1.save!
@user2 = User.create!(uid: "2234", nick: "bob", steam_url: "bleh", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif")
@user2.save!
@user3 = User.create!(uid: "3234", nick: "cliff", steam_url: "blih", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif")
@user3.save!
@user4 = User.create!(uid: "4234", nick: "dave", steam_url: "bloh", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif")
@user4.save!
@user5 = User.create!(uid: "5234", nick: "eric", steam_url: "bluh", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif")
@user5.save!

@player1 = Player.create!(game_type: "Highlander", league_level: "UGC Steel", location: "NA", notes: "i b super pro shpee", user_id: 3, spy: true)
@player1.save!
@player2 = Player.create!(game_type: "6v6", league_level: "ESEA Invite", location: "NA", user_id: 1, soldier: true, scout: true, sniper: true)
@player2.save!

@review1 = Review.create!(body: "This guy is soooooooo terrible at spy :P", user_id: 4, player_id: 1)
@review1.save!
@review2 = Review.create!(body: "True pro, pick him up quick", user_id: 3, player_id: 2)
@review2.save!

@team1 = Team.create!(name: "bballerz", tag: ">bb<", game_type: "Highlander", league_level: "UGC Steel", location: "NA", user_id: 5, spy: true)
@team1.save!
@team2 = Team.create!(name: "goingHAM", tag: "H4M", game_type: "6v6", league_level: "ETF2L Div5", location: "EU", user_id: 2, scout: true, demoman: true)
@team2.save!
