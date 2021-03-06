class Title < ActiveRecord::Base
	belongs_to :artist
    has_many :sales

    scope :sorted, lambda { order("e_title ASC")}

   # def self.populate(id)
   # 	find(id).populate
   # end	

=begin
   def connect_to_store
      session = ShopifyAPI::Session.new(self.url, self.access_token)
      session.valid?
      ShopifyAPI::Base.activate_session(session)
    end
=end
    def self.populate(id)
      url = "https://projecth.myshopify.com"
	  access_token = "68348e769f6cb3c191854d45d947ab81"
	  session = ShopifyAPI::Session.new(url, access_token)
	  session.valid?
	  ShopifyAPI::Base.activate_session(session)
	  title = find(id)
	  #title.update_attributes(:populated => 1)
	  e_title = title.e_title
	  artist_name = title.artist.e_name
	  title_id = title.id
		artist_id = title.artist_id
		#@orders = ShopifyAPI::Order.find(:all)
		#@orders = ShopifyAPI::Order.find_all(:status => :any)

		#puts "Total Number of Shopify Orders: #{@orders.length}"

	  sale_array = []


	
	    
    if title.populated == 1
        #for order in @orders do
        ShopifyAPI::Order.find_all(:status => :any) do |order|
          order_number = order.order_number
          first_name = order.customer.first_name
          last_name = order.customer.last_name
          email = order.customer.email
          created = order.created_at
          
          #created = Date.strptime(order.created_at, '%Y-%m-%dT%H:%M:%S.%L%z')
          #created = Time.at(order.created_at)

            for line_item in order.line_items do
              quantity = line_item.quantity.to_i
              if (line_item.title == e_title && line_item.vendor == artist_name)
                puts "Order Number: #{order_number}"
               #  if last_name.present?
                    unless Sale.exists?(order_number: order_number)
                      for i in 1..quantity	
                        sale_array.push([artist_id, title_id, order_number, first_name, last_name, email, line_item.variant_title, line_item.price, created])
                      end
                    end
               #  else
               #     sale_array.push([artist_id, title_id, first_name, "NULL", email, line_item.variant_id, line_item.price, created]) 
               #  end
                 #puts "Sale Array: #{sale_array}"
              end
            end  

            
        end 
        for sale in sale_array do 
           Sale.create(:artist_id => sale[0], :title_id => sale[1], :order_number => sale[2], :first_name => sale[3], :last_name => sale[4], :email => sale[5], :format => sale[6], :price => sale[7], :created_at => sale[8])    
        end 

        puts "Length of Sale Array: #{sale_array.length}"

        array_length = sale_array.length   
        title.update_attributes(:populated => 1)
       # flash[:notice] = "#{array_length} sales records have been populated for this title."
       # redirect_to(:action => 'show', :id => title.id) 
    else
     # puts "Sales records have already been populated for this title"
     # flash[:notice] = "Sales records have already been populated for this title."
     # redirect_to(:action => 'show', :id => title.id)
    end  


	title.update_attributes(:populated => 2) 

    end




















end
