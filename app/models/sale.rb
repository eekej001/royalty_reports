class Sale < ActiveRecord::Base
	belongs_to :title
	belongs_to :artist
end
