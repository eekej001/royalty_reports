class ReportsController < ShopifyApp::AuthenticatedController

 def index
    @artists = Artist.all
 end



end
