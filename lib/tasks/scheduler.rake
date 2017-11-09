	desc "This task is called by the Heroku scheduler add-on"
	task :royalty_reports => :environment do
	  #if (Time.now.month = 9 and Time.now.date = 28) or (Time.now.month = 3 and Time.now.date = 1) or (Time.now.month = 6 and Time.now.date = 1) or (Time.now.month = 9 and Time.now.date = 1) or (Time.now.month = 12 and Time.now.date = 1) 	
	  #if Time.now.month == 9 && Time.now.date == 29 || Time.now.month == 3 && Time.now.date == 1 || Time.now.month == 6 && Time.now.date = 1 || Time.now.month == 9 && Time.now.date == 1 || Time.now.month == 12 && Time.now.date == 1	
	 #if Time.now.month == 9 and Time.now.date == 29 || Time.now.month == 3 and Time.now.date == 1 || Time.now.month == 6 and Time.now.date = 1 || Time.now.month == 9 and Time.now.date == 1 || Time.now.month == 12 and Time.now.date == 1	

	 #if Time.now.day == 29

=begin	 
	 if (Time.now.month == 1 && Time.now.day == 1) || 
	 	(Time.now.month == 3 && Time.now.day == 1) ||
	 	(Time.now.month == 6 && Time.now.day == 1) ||
	 	(Time.now.month == 9 && Time.now.day == 1) ||
	 	(Time.now.month == 12 && Time.now.day == 1) 
	 	puts "Emailing royalty reports..."

		  puts "Emailing royalty reports..."
		  #session = ActionDispatch::Integration::Session.new(Rails.application)
		  #session.get "/proxy/index"
		  Artist.royalty_report
		  puts "Done."
	  else
	     puts "Not the 1st day of a quarter. Reports not sent."	  
	  end
=end

	     if (Time.now.month == 1 && Time.now.day == 1) 
	     	puts "Emailing royalty reports for January..."
	     	Artist.royalty_report([1])

	     elsif (Time.now.month == 2 && Time.now.day == 1) 
	     	puts "Emailing royalty reports for February..."
	     	Artist.royalty_report([1, 2])

	     elsif (Time.now.month == 3 && Time.now.day == 1) 
	     	puts "Emailing royalty reports for March..."
	     	Artist.royalty_report([1, 3])

	     elsif (Time.now.month == 4 && Time.now.day == 1) 
	     	puts "Emailing royalty reports for April..."
	     	Artist.royalty_report([1, 2, 4])

	     elsif (Time.now.month == 5 && Time.now.day == 1) 
	     	puts "Emailing royalty reports for May..."
	     	Artist.royalty_report([1, 5])

	     elsif (Time.now.month == 6 && Time.now.day == 1) 
	     	puts "Emailing royalty reports for June..."
	     	Artist.royalty_report([1, 2, 3, 6])

	     elsif (Time.now.month == 7 && Time.now.day == 1) 
	     	puts "Emailing royalty reports for July..."
	     	Artist.royalty_report([1, 7])

	     elsif (Time.now.month == 8 && Time.now.day == 1) 
	     	puts "Emailing royalty reports for August..."
	     	Artist.royalty_report([1, 2, 4, 8])

	     elsif (Time.now.month == 9 && Time.now.day == 1) 
	     	puts "Emailing royalty reports for September..."
	     	Artist.royalty_report([1, 3, 9])

	     elsif (Time.now.month == 10 && Time.now.day == 1) 
	     	puts "Emailing royalty reports for October..."
	     	Artist.royalty_report([1, 2, 5, 10])

	     elsif (Time.now.month == 11 && Time.now.day == 1) 
	     	puts "Emailing royalty reports for November..."
	     	Artist.royalty_report([1, 11])

##################################
	    elsif (Time.now.month == 11 && Time.now.day == 9) 
	     	puts "Emailing royalty reports for November(Test Mode)..."
	     	Artist.royalty_report([3, 12]) 	
###################################
	     else (Time.now.month == 12 && Time.now.day == 1) 
	     	puts "Emailing royalty reports for December..."
	     	Artist.royalty_report([1, 2, 3, 4, 6, 12])
	     end	

	end