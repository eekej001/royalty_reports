ShopifyApp.configure do |config|
  include PayPal::SDK::Rest
  include PayPal::SDK::Core::Logging
  config.api_key = "5b6c8beffd764fc95d6bcde8459c0b2a"
  config.secret = "a87f1122752655beffb8aa3da1a87e9d"
  config.scope = "read_orders, read_products, write_products"
  config.embedded_app = true
end
