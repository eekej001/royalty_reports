class Artist < ActiveRecord::Base
	has_many :titles
	has_many :sales, :through => :titles


	def self.royalty_report
	     @artists = Artist.all
	     @artists.each_with_index do |artist, index|
	        RoyaltyMail.royalty_report(index).deliver
	     end 	
	end 

end
