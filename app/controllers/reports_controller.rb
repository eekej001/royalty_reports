class ReportsController < ShopifyApp::AuthenticatedController

 def index
    @artists = Artist.all

      require 'paypal-sdk-rest'
      require './config/runner.rb'
      include PayPal::SDK::Rest
      include PayPal::SDK::Core::Logging
	  PayPal::SDK.configure(
	  :mode => "sandbox", # "sandbox" or "live"
	  :client_id => ENV["CLIENT_ID"],
	  :client_secret => ENV['SECRET'])

	  @payout = Payout.new(
	  {
	    :sender_batch_header => {
	      :sender_batch_id => SecureRandom.hex(8),
	      :email_subject => 'You have a Payout!',
	    },
	    :items => [
	      {
	        :recipient_type => 'EMAIL',
	        :amount => {
	          :value => '1.0',
	          :currency => 'USD'
	        },
	        :note => 'Thanks for your patronage!',
	        :receiver => 'customer@emanga.com',
	        :sender_item_id => "2014031400023",
	      }
	    ]
	  }
	)

	begin
	  @payout_batch = @payout.create
	  logger.info "Created Payout with [#{@payout_batch.batch_header.payout_batch_id}]"
	rescue ResourceNotFound => err
	  logger.error @payout.error.inspect
	end





 end

 def report


	
 	#@id = params[:option]
 	@id = params[:artist_id]
 	@start_date_str = params[:start_date]
 	@end_date_str = params[:end_date]
 	unless @start_date_str.nil?
	 	@start_date = Date.strptime(@start_date_str, '%m/%d/%Y')
	 	@end_date = Date.strptime(@end_date_str, '%m/%d/%Y')
	end 	
 	@artist = Artist.find_by id: @id
 	@titles = @artist.titles
 	artist_name = @artist.e_name
    
    unless params[:x_start_date].nil?
    	@x_start_date_og = params[:x_start_date]
    	@x_end_date_og = params[:x_end_date]
	 	@x_start_date = Date.strptime(params[:x_start_date], '%m/%d/%Y')
	 	@x_end_date = Date.strptime(params[:x_end_date], '%m/%d/%Y')

	 	filename = "#{artist_name}-#{@x_start_date}-#{@x_end_date}_Royalty Report.xlsx"
   


       respond_to do |format|
	      format.html
	      format.xlsx{ 
	        #response.headers['Content-Disposition'] = "attachment; filename='#{artist_name}-#{@x_start_date}-#{@x_end_date}_Royalty Report.xlsx'"
            #response.headers['Content-Disposition'] = "attachment; filename='#{filename}'"

          }
         #{
	      	#render xlsx: 'report', filename: "#{artist_name}-#{@x_start_date_og}-#{@x_end_date_og}.xlsx", disposition: 'inline',
	     # }
      end



    end

 	
 	
     


    #flash[:notice] = "The artist id is #{id}.  The start date is #{start_date}.  The end date is #{end_date}."
    #redirect_to(:action => 'index')

=begin
  respond_to do |format|
      format.html
      format.xlsx
     
    end
=end
 end



end


private

    def form_params
      params.require(:form).permit(:id, :start_date, :end_date)
    end

