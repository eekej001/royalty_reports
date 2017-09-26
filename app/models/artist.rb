class Artist < ActiveRecord::Base
	has_many :titles
	has_many :sales, :through => :titles
end
