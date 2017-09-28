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


order_list.each do | first_name, last_name, email, title |
	Order.create( first_name: first_name, last_name: last_name, email: email, title: title )
end

=end

##############################################################################################
                                   # MAIN DATABASE SEED #

##############################################################################################

=begin
artist_list = [
  [ "Mizuryu Kei", "合計売上", "miz@gmail.com"],
  [ "Kishi", "合計売上", "kishi@gmail.com"],
  [ "Tite", "合計売上", "tite@gmail.com"],
  [ "Toriyama", "合計売上", "tori@gmail.com"]
]




artist_list.each do | e_name, j_name, email |
	Artist.create( e_name: e_name, j_name: j_name, email: email )
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





a1t1_list = [
  [ "Bob", "Dole", "bobd@gmail.com", "PDF", 7.95],
  [ "Jane", "Doe", "janed@gmail.com", "MOBI", 7.95],
  [ "Craig", "Robinson", "craigr@gmail.com", "CBZ", 7.95],
  [ "Andy", "Sand", "andys@gmail.com", "PRC", 7.95],
]


a1t2_list = [
  [ "Randy", "Marsh", "randym@gmail.com", "PDF", 7.95],
  [ "Stan", "Marsh", "stanm@gmail.com", "MOBI", 7.95],
  [ "Kenny", "Roads", "kennyr@gmail.com", "CBZ", 7.95],
  [ "Albert", "Brand", "albertb@gmail.com", "PRC", 7.95],
]

a1t3_list = [
  [ "Mary", "Lamb", "maryl@gmail.com", "PDF", 7.95],
  [ "Peter", "Rogers", "peterr@gmail.com", "MOBI", 7.95],
  [ "Floyd", "Henderson", "floydh@gmail.com", "CBZ", 7.95],
  [ "Chris", "Dine", "chrisd@gmail.com", "PRC", 7.95],
]


a1t4_list = [
  [ "Lindsey", "Booth", "lindseyb@gmail.com", "PDF", 7.95],
  [ "Margaret", "Thatcher", "margiet@gmail.com", "MOBI", 7.95],
  [ "James", "Harlow", "jamesh@gmail.com", "CBZ", 7.95],
  [ "Paul", "Pierce", "paulp@gmail.com", "PRC", 7.95],
]





a2t1_list = [
  [ "Hung", "Jo", "hungj@gmail.com", "PDF", 7.95],
  [ "Brady", "Li", "bradyl@gmail.com", "MOBI", 7.95],
  [ "Fabio", "Gustavo", "fabiog@gmail.com", "CBZ", 7.95],
  [ "Nancy", "Air", "nancya@gmail.com", "PRC", 7.95],
]


a2t2_list = [
  [ "Luke", "Smith", "lukes@gmail.com", "PDF", 7.95],
  [ "Barry", "Nicks", "barryn@gmail.com", "MOBI", 7.95],
  [ "Fred", "Estere", "frede@gmail.com", "CBZ", 7.95],
  [ "Nick", "Oldman", "nicko@gmail.com", "PRC", 7.95],
]

a2t3_list = [
  [ "Tristan", "Thomas", "tristant@gmail.com", "PDF", 7.95],
  [ "Albert", "Hodge", "alberth@gmail.com", "MOBI", 7.95],
  [ "Hugh", "Backman", "hughb@gmail.com", "CBZ", 7.95],
  [ "Bruce", "Dane", "bruced@gmail.com", "PRC", 7.95],
]


a2t4_list = [
  [ "Cisco", "Power", "ciscop@gmail.com", "PDF", 7.95],
  [ "Laurie", "Growth", "laurieg@gmail.com", "MOBI", 7.95],
  [ "Grace", "Knight", "gracek@gmail.com", "CBZ", 7.95],
  [ "Nam", "Ho", "namh@gmail.com", "PRC", 7.95],
]



a3t1_list = [
  [ "Broly", "Mad", "brolym@gmail.com", "PDF", 7.95],
  [ "Ethan", "Crane", "ethanc@gmail.com", "MOBI", 7.95],
  [ "Haley", "Cherry", "haleyc@gmail.com", "CBZ", 7.95],
  [ "Morpheous", "Flight", "morpheousf@gmail.com", "PRC", 7.95],
]


a3t2_list = [
  [ "Muten", "Roshi", "mutenr@gmail.com", "PDF", 7.95],
  [ "Kira", "Light", "kiral@gmail.com", "MOBI", 7.95],
  [ "Austin", "Weak", "austinw@gmail.com", "CBZ", 7.95],
  [ "John", "Tsunami", "johnt@gmail.com", "PRC", 7.95],
]

a3t3_list = [
  [ "April", "Oheal", "aprilo@gmail.com", "PDF", 7.95],
  [ "Charles", "Maverick", "peterr@gmail.com", "MOBI", 7.95],
  [ "Logan", "Howlett", "loganh@gmail.com", "CBZ", 7.95],
  [ "Jean", "Black", "jeanb@gmail.com", "PRC", 7.95],
]


a3t4_list = [
  [ "Kevin", "Lung", "kevinl@gmail.com", "PDF", 7.95],
  [ "Reed", "Kichards", "reedk@gmail.com", "MOBI", 7.95],
  [ "Adrian", "Fierce", "adrianf@gmail.com", "CBZ", 7.95],
  [ "Matt", "Strong", "matts@gmail.com", "PRC", 7.95],
]



a4t1_list = [
  [ "Gretchen", "Stank", "gretchens@gmail.com", "PDF", 7.95],
  [ "Jennie", "Heart", "jennieh@gmail.com", "MOBI", 7.95],
  [ "Avril", "Lake", "avril@gmail.com", "CBZ", 7.95],
  [ "Blake", "Horse", "blakeh@gmail.com", "PRC", 7.95],
]


a4t2_list = [
  [ "Kennedy", "Frost", "kennedyf@gmail.com", "PDF", 7.95],
  [ "Victor", "Hot", "victorh@gmail.com", "MOBI", 7.95],
  [ "Terry", "Crimson", "terryc@gmail.com", "CBZ", 7.95],
  [ "Charlie", "Luci", "charliel@gmail.com", "PRC", 7.95],
]

a4t3_list = [
  [ "Nancy", "Pike", "nancyp@gmail.com", "PDF", 7.95],
  [ "Tammy", "Freeman", "tammyf@gmail.com", "MOBI", 7.95],
  [ "Sarah", "Goner", "sarahg@gmail.com", "CBZ", 7.95],
  [ "Julia", "Rogers", "juliar@gmail.com", "PRC", 7.95],
]


a4t4_list = [
  [ "Paulina", "Mark", "paulinam@gmail.com", "PDF", 7.95],
  [ "Stacey", "Rash", "stacyr@gmail.com", "MOBI", 7.95],
  [ "Carmen", "Burrows", "carmenb@gmail.com", "CBZ", 7.95],
  [ "Larry", "Stevens", "larrys@gmail.com", "PRC", 7.95],
]







a1t1_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 1, title_id: 1, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a1t2_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 1, title_id: 2, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a1t3_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 1, title_id: 3, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a1t4_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 1, title_id: 4, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a2t1_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 2, title_id: 5, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a2t2_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 2, title_id: 6, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a2t3_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 2, title_id: 7, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a2t4_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 2, title_id: 8, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a3t1_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 3, title_id: 9, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a3t2_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 3, title_id: 10, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a3t3_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 3, title_id: 11, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a3t4_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 3, title_id: 12, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a4t1_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 4, title_id: 13, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a4t2_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 4, title_id: 14, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a4t3_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 4, title_id: 15, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end

a4t4_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 4, title_id: 16, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end


=end


a4t4_list = [
  [ "Garry", "Alleck", "garrya@gmail.com", "PDF", 7.95],
  [ "Malcolm", "Rush", "malcolmr@gmail.com", "MOBI", 7.95],
  [ "Chansey", "Day", "chanseyd@gmail.com", "CBZ", 7.95],
  [ "Karen", "Black", "karenb@gmail.com", "PRC", 7.95],
  [ "Riley", "Freedman", "rileyf@gmail.com", "PRC", 7.95]
]


a4t4_list.each do | first_name, last_name, email, format, price |
	Sale.create( artist_id: 1, title_id: 6, first_name: first_name, last_name: last_name, email: email, format: format, price: price)
end