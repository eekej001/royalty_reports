class ArtistsController < ShopifyApp::AuthenticatedController

 def index
 	@artists = Artist.all
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
    @titles = @artist.titles
 end

 def sales_display
    @artist = Artist.find(params[:id])
    @sales = @artist.sales
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



  private 


    def artist_params
      params.require(:artist).permit(:e_name, :j_name, :email) 
    end 



end
