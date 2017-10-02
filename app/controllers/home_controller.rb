class HomeController < ShopifyApp::AuthenticatedController
  skip_before_action :verify_authenticity_token
  def index
=begin    
   		 @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
       @users = Form.all
       @doujinshis = Doujinshi.all
       @doujinshi_count = Doujinshi.count - 1
=end

  end


  def create
    @form = Form.new(form_params)
    if @form.save
      flash[:notice] = "Form saved successfully."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Form save unsuccessful."
      redirect_to(:action => 'index')   
    end  

    
    def customers
      @orders = Order.all
    end   
    


  end


  def d_create
    @douj = Doujinshi.new(douj_params)
    if @douj.save
      flash[:notice] = "Doujinshi Title Added"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Doujinshi Title Was Not Added"
      redirect_to(:action => 'index')   
    end  

  end



  def proxy
    redirect_to "https://www.emanga.com"
  end 	


end


private

    def form_params
      params.require(:form).permit(:first_name, :last_name)
    end

    def douj_params
      params.require(:doujinshi).permit(:title)
    end