class TitlesController < ShopifyApp::AuthenticatedController

 def index
      @titles = Title.paginate(:page => params[:page], :per_page => 20)
 end


 def create
    @title = Title.new(title_params)
    if @title.save
      flash[:notice] = "Title Successfully Added"
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
    @title = Title.find(params[:id])
 end

 def show
    @title = Title.find(params[:id])
 end

 def populate
    @title = Title.find(params[:id])
 end

 def populate_confirm
    @title = Title.find(params[:id])
    e_title = @title.e_title
    artist_name = @title.artist.e_name
    title_id = @title.id
    artist_id = @title.artist_id
    @orders = ShopifyAPI::Order.find(:all)
    
    sale_array = []
    
    if @title.populated == 0
        for order in @orders do
          first_name = order.customer.first_name
          last_name = order.customer.last_name
          email = order.customer.email
          created = order.created_at
          puts "Order created at: #{created}"
          #created = Date.strptime(order.created_at, '%Y-%m-%dT%H:%M:%S.%L%z')
          #created = Time.at(order.created_at)

            for line_item in order.line_items do
              if (line_item.title == e_title && line_item.vendor == artist_name)
                 if last_name.present?
                    sale_array.push([artist_id, title_id, first_name, last_name, email, line_item.variant_id, line_item.price, created])
                 else
                    sale_array.push([artist_id, title_id, first_name, "NULL", email, line_item.variant_id, line_item.price, created]) 
                 end
                 puts "Sale Array: #{sale_array}"
              end
            end  

            for sale in sale_array do 
              Sale.create(:artist_id => sale[0], :title_id => sale[1], :first_name => sale[2], :last_name => sale[3], :email => sale[4], :format => sale[5], :price => sale[6], :created_at => sale[7])    
            end 
        end 
        array_length = sale_array.length   
        @title.update_attributes(:populated => 1)
        flash[:notice] = "#{array_length} sales records have been populated for this title."
        redirect_to(:action => 'show', :id => @title.id) 
    else
      puts "Sales records have already been populated for this title"
      flash[:notice] = "Sales records have already been populated for this title."
      redirect_to(:action => 'show', :id => @title.id)
    end  
  

 end  

 def sales_display
    @title = Title.find(params[:id])
    @sales = @title.sales.paginate(:page => params[:page], :per_page => 20)
 end


 def update
    @title = Title.find(params[:id])
    if @title.update_attributes(title_params)
      flash[:notice] = "Title updated successfully."
      redirect_to(:action => 'index')
    else  
      render('edit')
    end  
  end 

def delete
    @title = Title.find(params[:id])
 end

 def destroy
    title = Title.find(params[:id]).destroy
    flash[:notice] = "The title '#{title.e_title}' has been successfully deleted."
    redirect_to(:action => 'index')
  end

  private 

    def title_params
      params.require(:title).permit(:artist_id, :j_title, :e_title, :srp ) 
    end 

 
end
