class RoomType < ApplicationRecord
	belongs_to :hotel
	validate :custom_validation
	private

	def custom_validation
		if (RoomType.where(hotel_id: self.hotel_id).pluck(:name).include?(self.name))
		  self.errors[:base] << "This Room name is already been used please use the other name."
		end
	end
end
