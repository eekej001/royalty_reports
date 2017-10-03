class Title < ActiveRecord::Base
	belongs_to :artist
    has_many :sales

    scope :sorted, lambda { order("title ASC")}
end
