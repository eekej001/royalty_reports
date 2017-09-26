class Title < ActiveRecord::Base
	belongs_to :artist
    has_many :sales
end
