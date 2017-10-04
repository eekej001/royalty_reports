class TitlesController < ShopifyApp::AuthenticatedController

 def index
      @titles = Title.sorted
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
