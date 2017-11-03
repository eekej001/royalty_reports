class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  def self.shopify_api_path
    #"https://#{Rails.configuration.api_key}:#{self.shopify_token}@#{self.shopify_domain}/admin"
    #5b6c8beffd764fc95d6bcde8459c0b2a
    "https://5b6c8beffd764fc95d6bcde8459c0b2a:68348e769f6cb3c191854d45d947ab81@projecth.myshopify.com/admin"
  end
end
