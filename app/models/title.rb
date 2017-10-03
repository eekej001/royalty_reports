class Title < ActiveRecord::Base
	belongs_to :artist
    has_many :sales

    scope :sorted, lambda { order("e_title ASC")}
end
