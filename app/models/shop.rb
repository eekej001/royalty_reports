class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  def self.shopify_api_path
    "https://#{Rails.configuration.api_key}:#{self.shopify_token}@#{self.shopify_domain}/admin"
  end
end
