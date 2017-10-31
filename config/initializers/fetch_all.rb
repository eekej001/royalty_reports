module ShopifyAPI
  class Base
    RETRY_AFTER = 60

    def self.find_all(params = {}, &block)
      params[:limit] ||= 50
      params[:page] = 1
      retried = false
      
      begin
        until find(:all, :params => params).each { |value| block.call(value) }.empty?
          params[:page] += 1
          retried = false
        end
      rescue ActiveResource::ServerError => ex
        unless retried
          sleep((ex.response['Retry-After'] || RETRY_AFTER).to_i)
          retried = true
          retry
        else
          raise ex
        end
      end
    end
  end
end