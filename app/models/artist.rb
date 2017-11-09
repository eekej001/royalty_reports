class Artist < ActiveRecord::Base
	has_many :titles
	has_many :sales, :through => :titles


	def self.royalty_report(array)

=begin		
	     @artists = Artist.all
	     @artists.each_with_index do |artist, index|
	        RoyaltyMail.royalty_report(index).deliver
	     end 
=end
       array.each do |id|
       	  @artists = Artist.where(:r_frequency => id)

       	  @artists.each do |artist|
       	  	RoyaltyMail.royalty_report(artist.id).deliver
          end
       
       end

	end 




end
