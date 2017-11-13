class ArtistsController < ShopifyApp::AuthenticatedController

 def index
 	@artists = Artist.paginate(:page => params[:page], :per_page => 20)
 end	


def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:notice] = "Artist (#{@artist.e_name}) Created"
      redirect_to(action: 'index')
     # redirect_to(action: 'artists', email: params[:email])
    else
      flash[:notice] = "The Artist Was Not Created"
      redirect_to(action: 'index')
    end  

  end


def edit
    @artist = Artist.find(params[:id])
 end

 def show
    @artist = Artist.find(params[:id])
 end

 def titles_display
    @artist = Artist.find(params[:id])
    @titles = @artist.titles.paginate(:page => params[:page], :per_page => 20)
    @path_marker = "titles_display" 
 end

 def sales_display
    @artist = Artist.find(params[:id])
    @sales = @artist.sales.paginate(:page => params[:page], :per_page => 20)
 end


 	


  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(artist_params)
      flash[:notice] = "#{@artist.e_name}'s information has been successfully updated."
      redirect_to(:action => 'index')
    else  
      render('edit')
    end  
  end 


def delete
    @artist = Artist.find(params[:id])
 end

 def destroy
    artist = Artist.find(params[:id]).destroy
    flash[:notice] = "#{artist.e_name} has been successfully deleted."
    redirect_to(action: 'index')
  end


def title_show
    @title = Title.find(params[:id])
 end

 def title_edit
    @title = Title.find(params[:id])
 end

 def title_edit2
    @title = Title.find(params[:id])
 end

 def title_update
    @title = Title.find(params[:id])
    if @title.update_attributes(title_params)
      flash[:notice] = "#{@title.e_title} updated successfully."
      redirect_to(:action => 'titles_display', :id => @title.id)
    else  
      render('title_edit')
    end  
 end

 def title_update2
    @title = Title.find(params[:id])
    if @title.update_attributes(title_params)
      flash[:notice] = "#{@title.e_title} updated successfully."
      redirect_to(:action => 'title_show', :id => @title.id)
    else  
      render('title_edit2')
    end  
 end	


 def title_delete
    @title = Title.find(params[:id])
 end

def title_delete2
    @title = Title.find(params[:id])
 end

 def title_destroy
    title = Title.find(params[:id]).destroy
    flash[:notice] = "The title '#{title.e_title}' has been successfully deleted."
    redirect_to(:action => 'titles_display', :id => title.artist_id)
 end 




  private 


    def artist_params
      params.require(:artist).permit(:e_name, :j_name, :email, :percent, :r_frequency, :p_frequency) 
    end 

    def title_params
      params.require(:title).permit(:artist_id, :j_title, :e_title, :srp) 
    end 



end
