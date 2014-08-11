# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user1 = User.create!(nick: "allen", profile: "blah", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif")
@user1.save!
@user2 = User.create!(nick: "bob", profile: "bleh", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif")
@user2.save!
@user3 = User.create!(nick: "cliff", profile: "blih", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif")
@user3.save!
@user4 = User.create!(nick: "dave", profile: "bloh", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif")
@user4.save!
@user5 = User.create!(nick: "eric", profile: "bluh", avatar: "http://www.alluserpics.com/data/thumbnails/14/christmas_cat.gif")
@user5.save!

@player1 = Player.create!(game_type: "highlander", league: "UGC", level: "steel", notes: "i b super pro shpee", user_id: 3, spy: true)
@player1.save!
@player2 = Player.create!(game_type: "6v6", league: "ESEA", level: "invite", user_id: 1, soldier: true, scout: true, sniper: true)
@player2.save!

@review1 = Review.create!(body: "This guy is soooooooo terrible at spy :P", user_id: 2, player_id: 3)
@review1.save!
@review2 = Review.create!(body: "True pro, pick him up quick", user_id: 3, player_id: 1)
@review2.save!

@team1 = Team.create!(name: "bballerz", tag: ">bb<", game_type: "highlander", league: "UGC", level: "steel", user_id: 5, spy: true)
@team1.save!
@team2 = Team.create!(name: "goingHAM", tag: "H4M", game_type: "6v6", league: "ETF2L", level: "div5", user_id: 2, scout: true, demoman: true)
@team2.save!
