class TitlesController < ShopifyApp::AuthenticatedController

 def index
      @titles = Title.sorted
 end


 def create
    @title = Title.new(title_params)
    if @title.save
      flash[:notice] = "Title Successfully Added"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Title Was Not Added"
      redirect_to(:action => 'index')   
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
    flash[:notice] = "The title '#{title.title}' has been successfully deleted."
    redirect_to(:action => 'index')
  end

  private 

    def title_params
      params.require(:title).permit(:artist_id, :j_title, :e_title, :srp ) 
    end 

 
end
