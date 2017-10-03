class salesController < ApplicationController

 def index
 	@sales = Sale.all
 end	



def create
    @sale = Sale.new(sales_params)
    if @sale.save
      flash[:notice] = "Sale Created"
      redirect_to(action: 'index')
     # redirect_to(action: 'sales', email: params[:email])
    else
      flash[:notice] = "The Sale Was Not Created"
      redirect_to(action: 'index')
    end  

  end



def delete
    @sale = Sale.find(params[:id])
 end

 def destroy
    sale = Sale.find(params[:id]).destroy
    flash[:notice] = "The sale has been successfully deleted."
    redirect_to(action: 'index')
  end



  private 


    def sale_params
      params.require(:sale).permit(:artist_id, :title_id, :first_name, :last_name, :email, :format, :price) 
    end 




end
