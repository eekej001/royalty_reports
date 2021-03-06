class TitlesController < ShopifyApp::AuthenticatedController

 def index
      @titles = Title.paginate(:page => params[:page], :per_page => 20)
 end


 def create
    @title = Title.new(title_params)
    if @title.save
      flash[:notice] = "#{@title.e_title} Successfully Added"
      c = request.path_parameters[:controller]
      a = request.path_parameters[:action]

      #if ((request.path_parameters[:controller] == "artists") && (request.path_parameters[:action] == "titles_display"))
      if params[:path_marker] == "titles_display"
        id = params[:id]
        redirect_to(:controller => 'artists', :action => 'titles_display', :id => id) 
      else  
        redirect_to(:action => 'index')
      end   


    else
      flash[:notice] = "Title Was Not Added"
      if params[:path_marker] == "titles_display"
        id = params[:id]
        redirect_to(:controller => 'artists', :action => 'titles_display', :id => id) 
      else  
        redirect_to(:action => 'index')
      end 
      
    end  

  end

 def edit
    if params[:path_marker]
      @path_marker = params[:path_marker]
    end  
    @title = Title.find(params[:id])
 end

 def show
    if params[:path_marker]
      @path_marker = params[:path_marker]
    end  
    @title = Title.find(params[:id])
 end

 def populate
    @title = Title.find(params[:id])
 end

 def populate_confirm
   title = Title.find(params[:id])
   title.update_attributes(:populated => 1)
   # @title.delay.populate(params[:id])
   # orders = []
    
   # ShopifyAPI::Order.find_all(:status => :any) do |order|
   #   orders.push[order]
   # end
   #session = ShopifyApp::SessionRepository.retrieve(1)
   #token = session.request_token(params)

   #shop = ShopifyAPI::Shop.current
   #shop = Shop.find_by(shopify_domain: "projecth.myshopify.com")
   #token = shop.shopify_token
   #shop = ShopifyApp::SessionRepository.retrieve(shop.id)
   #session = ShopifyAPI::Session.new("projecth.myshopify.com", shop.shopify_token)

   # Title.delay.populate(params[:id])
   #response = request.env['omniauth.auth']
   #token = response['credentials']['token']
   #shop = params[:shop]
   #puts "Beginning Request Output..."
   #puts token
   #puts shop
   #puts "Ending Request Output"
   Title.delay.populate(params[:id])
   #Shop.delay.connect_to_store
    redirect_to(:action => 'show', :id => params[:id])
    # , notice: "Populating database..." 

 end  

 def sales_display
    @title = Title.find(params[:id])
    @sales = @title.sales.paginate(:page => params[:page], :per_page => 20)
 end


 def update
    @title = Title.find(params[:id])
    if @title.update_attributes(title_params)
      flash[:notice] = "#{@title.e_title} updated successfully."
      redirect_to(:action => 'index')
    else  
      render('edit')
    end  
  end 

  def update2
    @title = Title.find(params[:id])
    if @title.update_attributes(title_params)
      flash[:notice] = "#{@title.e_title} updated successfully."
      redirect_to(:action => 'show', :id => @title.id)
    else  
      render('edit')
    end  
  end 

def delete
    if params[:path_marker]
      @path_marker = params[:path_marker]
    end  
    @title = Title.find(params[:id])
 end

 def destroy
    title = Title.find(params[:id]).destroy
    Sale.destroy_all(:title_id => title.id)
    flash[:notice] = "The title '#{title.e_title}' has been successfully deleted."
    redirect_to(:action => 'index')
  end

  private 

    def title_params
      params.require(:title).permit(:artist_id, :j_title, :e_title, :srp) 
    end 

 
end
