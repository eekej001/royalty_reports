	desc "This task is called by the Heroku scheduler add-on"
	task :royalty_reports => :environment do
	  puts "Emailing royalty reports..."
	  #session = ActionDispatch::Integration::Session.new(Rails.application)
	  #session.get "/proxy/index"
	  Artist.royalty_report
	  puts "Done."
	end