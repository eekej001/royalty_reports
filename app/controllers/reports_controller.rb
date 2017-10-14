class ReportsController < ShopifyApp::AuthenticatedController

 def index
    @artists = Artist.all
 end

 def report
 	id = params[:id]
 	start_date = params[:start_date]
 	end_date = params[:end_date]
    flash[:notice] = "The artist id is #{id}.  The start date is #{start_date}.  The end date is #{end_date}."
    redirect_to(:action => 'index')

end


private

    def form_params
      params.require(:form).permit(:id, :start_date, :end_date)
    end

