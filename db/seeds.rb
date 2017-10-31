# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
order_list = [
  [ "Charlie", "Dare", "a@gmail.com", "Hentai A"],
  [ "Luke", "Power", "b@gmail.com", "Hentai B"],
  [ "Jessica", "Alias", "c@gmail.com", "Hentai C"],
  [ "Danny", "Iron", "d@gmail.com", "Hentai D"]
]


order_list.each do | order_number, first_name, last_name, email, title |
	Order.create( order_number: order_number, first_name: first_name, last_name: last_name, email: email, title: title )
end

=end

##############################################################################################
                                   # MAIN DATABASE SEED #

##############################################################################################

=begin
   artist_list = [
  [ "Mizuryu Kei", "合計売上", "miz@gmail.com", 20, 3, 3],
  [ "Kishi", "合計売上", "kishi@gmail.com", 30, 4, 4],
  [ "Tite", "合計売上", "tite@gmail.com", 40, 1, 6],
  [ "Toriyama", "合計売上", "tori@gmail.com", 50, 12, 12],
  [ "Yamatogawa", "合計売上", "ebenezer@emanga.com", 50, 3, 3]
]
=end


artist_list = [
  [ "Mizuryu Kei", "合計売上", "ebenezer@emanga.com", 20, 3, 3],
  [ "Kishi", "合計売上", "ebenezer@emanga.com", 30, 4, 4],
  [ "Tite", "合計売上", "ebenezer@emanga.com", 40, 1, 6],
  [ "Toriyama", "合計売上", "ebenezer@emanga.com", 50, 12, 12],
  [ "Yamatogawa", "合計売上", "ebenezer@emanga.com", 50, 3, 3]
]




artist_list.each do | order_number, e_name, j_name, email, percent, r_frequency, p_frequency |
	Artist.create( e_name: e_name, j_name: j_name, email: email, percent: percent, r_frequency: r_frequency, p_frequency: p_frequency )
end





title1_list = [
  [ "ダウンロ", "Day 1", 6.95],
  [ "デジタル配信", "Day 2", 7.95],
  [ "日本語", "Day 3", 8.95],
  [ "合計売上", "Day 4", 9.95]
]


title2_list = [
  [ "Ku", "Night 1", 7.95],
  [ "Ichi", "Night 2", 7.95],
  [ "Ni", "Night 3", 7.95],
  [ "San", "Night 4", 7.95]
]


title3_list = [
  [ "Sai", "Noon 1", 7.95],
  [ "Yosh", "Noon 2", 7.95],
  [ "Ari", "Noon 3", 7.95],
  [ "Mate", "Noon 4", 7.95]
]


title4_list = [
  [ "Ka", "Dawn 1", 7.95],
  [ "Go", "Dawn 2", 7.95],
  [ "Me", "Dawn 3", 7.95],
  [ "Chid", "Dawn 4", 7.95]
]

title5_list = [
  [ "Aqua Bless (2nd Edition)", "J-Aqua", 9.95],
  [ "Boing Boing (2nd Edition)", "J-Boing", 9.95],
  [ "How Good Was I? (2nd Edition)", "J-How", 9.95],
  [ "Power Play! (2nd Edition)", "J-Power", 9.95],
  [ "Vanilla Essence", "J-Vanilla", 9.95],
  [ "Witchcraft (2nd Edition)", "J-Witch", 9.95]
]


title1_list.each do | j_title, e_title, srp |
	Title.create( artist_id: 1, j_title: j_title, e_title: e_title, srp: srp )
end


title2_list.each do | j_title, e_title, srp |
	Title.create( artist_id: 2, j_title: j_title, e_title: e_title, srp: srp )
end

title3_list.each do | j_title, e_title, srp |
	Title.create( artist_id: 3, j_title: j_title, e_title: e_title, srp: srp )
end

title4_list.each do | j_title, e_title, srp |
	Title.create( artist_id: 4, j_title: j_title, e_title: e_title, srp: srp )
end

title5_list.each do | j_title, e_title, srp |
	Title.create( artist_id: 5, j_title: j_title, e_title: e_title, srp: srp )
end





a1t1_list = [
  [ 1, "Bob", "Dole", "bobd@gmail.com", "PDF", 7.95],
  [ 2, "Jane", "Doe", "janed@gmail.com", "MOBI", 7.95],
  [ 3, "Craig", "Robinson", "craigr@gmail.com", "CBZ", 7.95],
  [ 4, "Andy", "Sand", "andys@gmail.com", "PRC", 7.95],
]


a1t2_list = [
  [ 5, "Randy", "Marsh", "randym@gmail.com", "PDF", 7.95],
  [ 6, "Stan", "Marsh", "stanm@gmail.com", "MOBI", 7.95],
  [ 7, "Kenny", "Roads", "kennyr@gmail.com", "CBZ", 7.95],
  [ 8, "Albert", "Brand", "albertb@gmail.com", "PRC", 7.95],
]

a1t3_list = [
  [ 9, "Mary", "Lamb", "maryl@gmail.com", "PDF", 7.95],
  [ 10, "Peter", "Rogers", "peterr@gmail.com", "MOBI", 7.95],
  [ 11, "Floyd", "Henderson", "floydh@gmail.com", "CBZ", 7.95],
  [ 12, "Chris", "Dine", "chrisd@gmail.com", "PRC", 7.95],
]


a1t4_list = [
  [ 13, "Lindsey", "Booth", "lindseyb@gmail.com", "PDF", 7.95],
  [ 14, "Margaret", "Thatcher", "margiet@gmail.com", "MOBI", 7.95],
  [ 15, "James", "Harlow", "jamesh@gmail.com", "CBZ", 7.95],
  [ 16, "Paul", "Pierce", "paulp@gmail.com", "PRC", 7.95],
]





a2t1_list = [
  [ 17, "Hung", "Jo", "hungj@gmail.com", "PDF", 7.95],
  [ 18, "Brady", "Li", "bradyl@gmail.com", "MOBI", 7.95],
  [ 19, "Fabio", "Gustavo", "fabiog@gmail.com", "CBZ", 7.95],
  [ 20, "Nancy", "Air", "nancya@gmail.com", "PRC", 7.95],
]


a2t2_list = [
  [ 21, "Luke", "Smith", "lukes@gmail.com", "PDF", 7.95],
  [ 22, "Barry", "Nicks", "barryn@gmail.com", "MOBI", 7.95],
  [ 23, "Fred", "Estere", "frede@gmail.com", "CBZ", 7.95],
  [ 24, "Nick", "Oldman", "nicko@gmail.com", "PRC", 7.95],
]

a2t3_list = [
  [ 25, "Tristan", "Thomas", "tristant@gmail.com", "PDF", 7.95],
  [ 26, "Albert", "Hodge", "alberth@gmail.com", "MOBI", 7.95],
  [ 27, "Hugh", "Backman", "hughb@gmail.com", "CBZ", 7.95],
  [ 28, "Bruce", "Dane", "bruced@gmail.com", "PRC", 7.95],
]


a2t4_list = [
  [ 29, "Cisco", "Power", "ciscop@gmail.com", "PDF", 7.95],
  [ 30, "Laurie", "Growth", "laurieg@gmail.com", "MOBI", 7.95],
  [ 31, "Grace", "Knight", "gracek@gmail.com", "CBZ", 7.95],
  [ 32, "Nam", "Ho", "namh@gmail.com", "PRC", 7.95],
]



a3t1_list = [
  [ 33, "Broly", "Mad", "brolym@gmail.com", "PDF", 7.95],
  [ 34, "Ethan", "Crane", "ethanc@gmail.com", "MOBI", 7.95],
  [ 35, "Haley", "Cherry", "haleyc@gmail.com", "CBZ", 7.95],
  [ 36, "Morpheous", "Flight", "morpheousf@gmail.com", "PRC", 7.95],
]


a3t2_list = [
  [ 37, "Muten", "Roshi", "mutenr@gmail.com", "PDF", 7.95],
  [ 38, "Kira", "Light", "kiral@gmail.com", "MOBI", 7.95],
  [ 39, "Austin", "Weak", "austinw@gmail.com", "CBZ", 7.95],
  [ 40, "John", "Tsunami", "johnt@gmail.com", "PRC", 7.95],
]

a3t3_list = [
  [ 41, "April", "Oheal", "aprilo@gmail.com", "PDF", 7.95],
  [ 42, "Charles", "Maverick", "peterr@gmail.com", "MOBI", 7.95],
  [ 43, "Logan", "Howlett", "loganh@gmail.com", "CBZ", 7.95],
  [ 44, "Jean", "Black", "jeanb@gmail.com", "PRC", 7.95],
]


a3t4_list = [
  [ 45, "Kevin", "Lung", "kevinl@gmail.com", "PDF", 7.95],
  [ 46, "Reed", "Kichards", "reedk@gmail.com", "MOBI", 7.95],
  [ 47, "Adrian", "Fierce", "adrianf@gmail.com", "CBZ", 7.95],
  [ 48, "Matt", "Strong", "matts@gmail.com", "PRC", 7.95],
]



a4t1_list = [
  [ 49, "Gretchen", "Stank", "gretchens@gmail.com", "PDF", 7.95],
  [ 50, "Jennie", "Heart", "jennieh@gmail.com", "MOBI", 7.95],
  [ 51, "Avril", "Lake", "avril@gmail.com", "CBZ", 7.95],
  [ 52, "Blake", "Horse", "blakeh@gmail.com", "PRC", 7.95],
]


a4t2_list = [
  [ 53, "Kennedy", "Frost", "kennedyf@gmail.com", "PDF", 7.95],
  [ 54, "Victor", "Hot", "victorh@gmail.com", "MOBI", 7.95],
  [ 55, "Terry", "Crimson", "terryc@gmail.com", "CBZ", 7.95],
  [ 56, "Charlie", "Luci", "charliel@gmail.com", "PRC", 7.95],
]

a4t3_list = [
  [ 57, "Nancy", "Pike", "nancyp@gmail.com", "PDF", 7.95],
  [ 58, "Tammy", "Freeman", "tammyf@gmail.com", "MOBI", 7.95],
  [ 59, "Sarah", "Goner", "sarahg@gmail.com", "CBZ", 7.95],
  [ 60, "Julia", "Rogers", "juliar@gmail.com", "PRC", 7.95],
]


a4t4_list = [
  [ 61, "Paulina", "Mark", "paulinam@gmail.com", "PDF", 7.95],
  [ 62, "Stacey", "Rash", "stacyr@gmail.com", "MOBI", 7.95],
  [ 63, "Carmen", "Burrows", "carmenb@gmail.com", "CBZ", 7.95],
  [ 64, "Larry", "Stevens", "larrys@gmail.com", "PRC", 7.95],
]







a1t1_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 1, title_id: 1, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a1t2_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 1, title_id: 2, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a1t3_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 1, title_id: 3, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a1t4_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 1, title_id: 4, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a2t1_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 2, title_id: 5, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a2t2_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 2, title_id: 6, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a2t3_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 2, title_id: 7, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a2t4_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 2, title_id: 8, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a3t1_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 3, title_id: 9, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a3t2_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 3, title_id: 10, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a3t3_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 3, title_id: 11, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a3t4_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 3, title_id: 12, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a4t1_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 4, title_id: 13, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a4t2_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 4, title_id: 14, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a4t3_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 4, title_id: 15, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a4t4_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 4, title_id: 16, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end




=begin

a4t4_list = [
  [ "Garry", "Alleck", "garrya@gmail.com", "PDF", 7.95],
  [ "Malcolm", "Rush", "malcolmr@gmail.com", "MOBI", 7.95],
  [ "Chansey", "Day", "chanseyd@gmail.com", "CBZ", 7.95],
  [ "Karen", "Black", "karenb@gmail.com", "PRC", 7.95],
  [ "Riley", "Freedman", "rileyf@gmail.com", "PRC", 7.95]
]


a4t4_list.each do | order_number, first_name, last_name, email, format, price |
	Sale.create( artist_id: 1, title_id: 6, order_number: order_number, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

=end