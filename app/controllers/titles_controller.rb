class TitlesController < ShopifyApp::AuthenticatedController

 def index
      @titles = Title.sorted
 end


 def create
    @title = Title.new(title_params)
    if @title.save
      flash[:notice] = "Title Successfully Added"

      if ((request.path_parameters[:controller] == "artists") && (request.path_parameters[:action] == "titles_display"))
        @artist = Artist.find(params[:id])
        redirect_to(:controller => 'artists', :action => 'titles_display') 
      else  
        redirect_to(:action => 'index')
      end   


    else
      flash[:notice] = "Title Was Not Added"
      if ((request.path_parameters[:controller] == "artists") && (request.path_parameters[:action] == "titles_display"))
        @artist = Artist.find(params[:id])
        redirect_to(:controller => 'artists', :action => 'titles_display') 
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
