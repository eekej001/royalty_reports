class ReportsController < ShopifyApp::AuthenticatedController

 def index
    @artists = Artist.all
 end

 def report
	
 	@id = params[:option]
 	@start_date_str = params[:start_date]
 	@end_date_str = params[:end_date]
 	@start_date = Date.strptime(@start_date_str, '%m/%d/%Y')
 	@end_date = Date.strptime(@end_date_str, '%m/%d/%Y')
 	artist = Artist.find_by id: @id
 	@titles = artist.titles

 	@x_start_date = params[:start_date]
 	@x_end_date = params[:end_date]

 	respond_to do |format|
      format.html
      format.xlsx
     
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

