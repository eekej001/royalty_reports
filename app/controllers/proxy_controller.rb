class ProxyController < ApplicationController
 skip_before_action :verify_authenticity_token
  def index
=begin 
    @customers = Order.all


  respond_to do |format|
    format.html
    format.xlsx
   
  end

  @email = 'ebenezer@emanga.com'

  RoyaltyMail.sample_email(@customers).deliver	
  #RoyaltyMail.sample_email(@email).deliver


  #write a for loop here.  for each artist, generate pass down artists.sales and send email
=end 

   @titles = Artist.first.titles
    respond_to do |format|
      format.html
      format.xlsx{
         #response.headers['Content-Disposition'] = 'attachment; filename="report.xlsx"'
         render xlsx: 'index',  filename: "report.xlsx", disposition: 'inline', xlsx_created_at: 3.days.ago, xlsx_author: "Elmer Fudd"
      }
     
    end

    @email = 'ebenezer@emanga.com'
    @artists = Artist.all

    @artists.each_with_index do |artist, index|
      #RoyaltyMail.royalty_report(index).deliver
    end  

    #RoyaltyMail.sample_email(@titles).deliver   
=begin
  @sample_array = []

  @sample_array.push([1,2,3,4])
  @sample_array.push([5,6,7,8])
  @a= [[1,2],[3,4]]
  puts @sample_array[0][0]
  #puts @a[0][1]
=end

  end


def webhook

     @artists = Artist.all
     @titles = Title.all
     
    
     webhook_json = JSON.parse request.body.read
     fn = webhook_json["billing_address"]["first_name"]
     ln = webhook_json["billing_address"]["last_name"]
     email = webhook_json["email"]
     order_number = webhook_json["number"]
     line_items = webhook_json["line_items"]
     
    
    for a in line_items do

     artist_id = nil
     title_id = nil
     sale_array = []

      for b in @artists do
          if a["vendor"] == b["e_name"]    
            artist_id = b["id"]
          else
            artist_id = 2  
         end
      end  #artist loop

      for c in @titles do
          if a["title"] == c["e_title"]    
            title_id = c["id"]
         end
      end #titles loop

      #if artist_id & title_id not nil,
      if (artist_id.present? && title_id.present?)
=begin 
        a = Artist.where("id = #{artist_id}")
        a_name = a[0].e_name
        t = Title.where("id = #{title_id}")
        t_name = t[0].e_title
        puts "Artist Name:  #{a_name}"
        puts  "Title Name: #{t_name}"
=end          
         puts "Artist ID: #{artist_id}"
         puts "Title ID: #{title_id}"
         puts "Variant ID: #{a['variant_id']}"
         puts "Price: #{a['price']}"

         if (a["variant_id"].present?)
          sale_array.push(artist_id, title_id, a["variant_id"], a["price"])
         else
          sale_array.push(artist_id, title_id, "No Format", a["price"]) 
         end
         puts "Sale Array: #{sale_array}"
       
      else
        puts "Artist ID: #{artist_id}"
        puts "Title ID: #{title_id}"
        puts "This sale item does not belong to one of the Doujinshi Artists."   
      end


      Sale.create(:artist_id => sale_array[0], :title_id => sale_array[1], :order_number => "#{order_number}", :first_name => "#{fn}", :last_name => "#{ln}", :email => "#{email}", :format => sale_array[2], :price => sale_array[3])
    end #line_items loop


      
=begin
      puts "Begin Sale Array Output"
      for d in sale_array do
        puts d
      end 

      puts "End Sale Array Output"
      
=end

=begin
    for e in sale_array do 
      puts "Order does not exist. Time to create."
      puts "Begin Sale_Array Output"
      puts e[0]
      puts e[1]
      puts e[2]
      puts e[3]
      puts "End Sale_Array Output"
      Sale.create(:artist_id => e[0], :title_id => e[1], :first_name => "#{fn}", :last_name => "#{ln}", :email => "#{email}", :format => e[2], :price => e[3])
    end  
=end  

   #redirect_to(:action => 'index') 

  end 


  def refund
     @sales = Sale.all
     
    
     refund_json = JSON.parse request.body.read
     order_id = refund_json["order_id"]
     line_items = refund_json["line_items"]
      

     void_sale = Sale.where(order_number: order_id) 

     unless void_sale.nil?
        Sale.destroy(void_sale.id)
        puts "Sales Record with ID #{void_sale.order_number} has been deleted."
     end 

  end











































  def create
    @form = Form.new(form_params)
    if @form.save	
      flash[:notice] = "Form saved successfully."
      redirect_to "https://www.projecthentai.com"
    else
      flash[:notice] = "Form save unsuccessful."
      redirect_to(:action => 'index')   
    end  
     #redirect_to(:action => 'index') 
  end



  def query
=begin WORKING TEST CODE 	
    fname = params[:username]
    @matchup = Form.where(:first_name => fname)
    render :json => @matchup
=end

    email = params[:user]
    @matchup = Order.where(:email => email)
    render :json => @matchup


    #### MANUAL JSON TEXT SEND  #####   
    #render :json => '{"name":"Testing", "age":31, "city":"Los Angeles"}'
    #### END #####
    

    #matchupS = matchup.to_s

    #matchup = Form.where(:first_name => "IT3").first
    #matchupN = matchup.last_name
    #render :json => matchupN
    
    #render :json => '"Testing"'
    #render :html => "<p>Testing</p>"
    #render :json => matchupS
   # redirect_to(:action => 'index') 

=begin
   respond_to do |format|
     format.html
     format.json { render :json => matchup }
   end
=end

=begin
    if request.xhr?
        render :json => { matchup }
     end
=end


  end


  def doujinshi_list
  	dl = Doujinshi.all
  	douj_array = []
    dl.each { |title| douj_array.push(title['title'])}
    render :json => douj_array
  end

  def dropbox_count
    require 'dropbox_sdk'
    client = DropboxClient.new(DROPBOX_ACCESS_TOKEN) 
    dbSearch = client.search('/Doujinshi', '.')
    @count = dbSearch.length
    send_data @count, :type => 'text/plain', disposition: "inline", :x_sendfile=> true
  end	



  def dropbox
  	require 'dropbox_sdk'
  	require 'json'
    
  	#dbsession = DropboxSession.new(DROPBOX_APP_KEY, DROPBOX_APP_KEY_SECRET)
  	#client = DropboxClient.new(dbsession, DROPBOX_APP_MODE)
    
    #flow = DropboxOAuth2FlowNoRedirect.new(DROPBOX_APP_KEY, DROPBOX_APP_KEY_SECRET) 
    client = DropboxClient.new(DROPBOX_ACCESS_TOKEN) 
    @dbImage = client.get_file('/Doujinshi/MG59_000.gif')
    @dbSearch = client.search('/Doujinshi', '.')

    @name_array = []
    @image_array = []
    @test_array = ["one", "two"]
    num_array = []

    @dbSearch.each { |name| @name_array.push(name['path'])}

    @name_array.each { |path| @image_array.push(client.get_file(path))}
    
    db_hash = Hash[@image_array.collect { |item| [item, ""] } ]

    ['one', 'two', 'three'].each { |x| num_array.push(x)}


=begin
    @image_array.to_s.encode('UTF-8', {
	  :invalid => :replace,
	  :undef   => :replace,
	  :replace => '?'
	})
=end
    #@image_array_json = @image_array.to_json

    #send_data @image_array, :type => 'text/plain', disposition: "inline", :x_sendfile=> true
    #send_data @test_array, :type => 'text/plain', disposition: "inline", :x_sendfile=> true

    #send_data @image_array, :type => 'image/gif', disposition: "inline", :x_sendfile=> true
    #render :json => @image_array_json
    #render :json => @image_array
    send_data num_array, :type => 'text/plain', disposition: "inline", :x_sendfile=> true



    #@clientinfo = client.account_info()


    #/Godzilla/Production/Group%20100/Harlequin%202014/DE-%20A%20Paper%20Marriage/-GIF-1200/MG59_000.gif
    #/Doujinshi/MG59_000.gif
    


  end







  def dropbox_pull
  	require 'dropbox_sdk'
  	require 'json'

    pID = params[:pID].to_i
    dir = params[:dir]
    path = '/Doujinshi/' + dir + '/'
    client = DropboxClient.new(DROPBOX_ACCESS_TOKEN) 
    #@dbSearch = client.search('/Doujinshi/', '.')
    @dbSearch = client.search( path, '.')
    @dbIndivObj = @dbSearch[pID]
    @dbImage = client.get_file(@dbIndivObj['path'])

    
  


    send_data @dbImage, :type => 'image/gif', disposition: "inline", :x_sendfile=> true

  end














=begin
  def send(blank=nil)
     #write code to send public html file with content-type: application/liquid





     @filename = "#{Rails.root}/public/test.liquid"
     send_file @filename, :type => 'application/liquid', :x_sendfile=> true
   




     #format.html

     #render "#{Rails.root}/public/test.liquid", content_type: 'application/liquid'
     
     #render('index')



     #render :layout => false, :content_type => 'application/liquid' if Rails.env.production?
     #filename = File.join(Rails.root, "/public/signup.html")
     #send_file(filename, :filename => "signup.html", :type => 'text/html', :disposition => "inline")




     #send_file(@filename, :type => 'application/liquid; charset=utf-8')
  end	
=end

  def image_test(blank=nil)
    require 'base64'
  	@filename = "#{Rails.root}/public/puppy.jpg"
  	@filenameEnc = Base64.encode64(@filename)

  	#send_data @filenameEnc, :type => 'text/plain', disposition: "inline", :x_sendfile=> true

    send_file @filename, :type => 'image/jpg', disposition: "inline", :x_sendfile=> true

  end	

=begin
  def webhook
     @douj_titles = Doujinshi.all
     title_array = []
    
     webhook_json = JSON.parse request.body.read
     fn = webhook_json["billing_address"]["first_name"]
  	 ln = webhook_json["billing_address"]["last_name"]
     email = webhook_json["email"]
     line_items = webhook_json["line_items"]
	  
	  for a in @douj_titles do
	   #puts a["title"]  
	    for b in line_items do
	    	#puts b["title"]
	       # if b[0].title == a["title"]    
	        #  title_array.push[b[0].title]
             
	        if b["title"] == a["title"]    
	          puts "Match: " + b["title"]
	          title_array.push b["title"]
	       end
	    end
	  end
      

      puts "Begin Title Array Output"
      for d in title_array do
      	puts d
      end	

      puts "End Title Array Output"
	  #Create entry for each title_array
	  #put in if statement to stop Order creation if the order alreadt exists
	  #   (some customers might accidentally attempt to buy the same title twice)
      
      

	  for c in title_array do 
	  	puts "Starting Order History Check"
	  	#exist_check = Order.where(:first_name => "#{fn}", :last_name => "#{ln}", :email => "#{email}", :title => c).first
	  	#exist_check2 = exist_check["first_name"]
	  	#if Order.where(:first_name => "#{fn}", :last_name => "#{ln}", :email => "#{email}", :title => c).first
	  	if Order.exists?(:first_name => "#{fn}", :last_name => "#{ln}", :email => "#{email}", :title => c)
	  	#if exist_check.persisted?
        #if exist_check2
         #  puts exist_check2
	  	   puts "Order exists so order was not created."
	  	   #puts Order.where(:first_name => "#{fn}", :last_name => "#{ln}", :email => "#{email}", :title => c) 
	  	    # puts "All: "
            # for e in Order.all do
	  	     #  puts e
	  	   #  end
	  	else
	  	  puts "Order does not exist. Time to create."
	  	   Order.create(:first_name => "#{fn}", :last_name => "#{ln}", :email => "#{email}", :title => c)
	  	end   
	  end  
       puts "Ending Order History Check"
  end	
=end

  def proxy
    redirect_to "https://www.projecthentai.com"
  end 	


end


private

    def form_params
      params.require(:form).permit(:first_name, :last_name)
    end