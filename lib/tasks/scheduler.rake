	desc "This task is called by the Heroku scheduler add-on"
	task :royalty_reports => :environment do
	  #if (Time.now.month = 9 and Time.now.date = 28) or (Time.now.month = 3 and Time.now.date = 1) or (Time.now.month = 6 and Time.now.date = 1) or (Time.now.month = 9 and Time.now.date = 1) or (Time.now.month = 12 and Time.now.date = 1) 	
	  #if Time.now.month == 9 && Time.now.date == 28 || Time.now.month == 3 && Time.now.date == 1 || Time.now.month == 6 && Time.now.date = 1 || Time.now.month == 9 && Time.now.date == 1 || Time.now.month == 12 && Time.now.date == 1	
	 if Time.now.day == 29
		  puts "Emailing royalty reports..."
		  #session = ActionDispatch::Integration::Session.new(Rails.application)
		  #session.get "/proxy/index"
		  Artist.royalty_report
		  puts "Done."
	  else
	     puts "Not the 1st day of a quarter.  Reports not sent"	  
	  end

	end