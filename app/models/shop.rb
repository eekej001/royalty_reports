class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  def self.shopify_api_path
    #"https://#{Rails.configuration.api_key}:#{self.shopify_token}@#{self.shopify_domain}/admin"
    #5b6c8beffd764fc95d6bcde8459c0b2a
    "https://5b6c8beffd764fc95d6bcde8459c0b2a:68348e769f6cb3c191854d45d947ab81@projecth.myshopify.com/admin"
  end

  def self.connect_to_store
  #session = ShopifyAPI::Session.new(self.url, self.access_token)
  url = "https://projecth.myshopify.com"
  access_token = 68348e769f6cb3c191854d45d947ab81
  session = ShopifyAPI::Session.new(url, access_token)
  session.valid?
  ShopifyAPI::Base.activate_session(session)
  order = ShopifyAPI::Order.find(1)
	    puts "Begin Order Number Output" 
        puts orders[1].order_number
        puts "End Order Number Output"    


  end
end
