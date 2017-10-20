class ReportsController < ShopifyApp::AuthenticatedController

 def index
    @artists = Artist.all
 end

 def report


	
 	@id = params[:option]
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
   


       respond_to do |format|
	      format.html
	      format.xlsx{ 
	        response.headers['Content-Disposition'] = "attachment; filename='#{artist_name}-#{@x_start_date_og}-#{@x_end_date_og}.xlsx'"
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

