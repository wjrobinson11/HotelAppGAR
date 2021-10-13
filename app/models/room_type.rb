class RoomType < ApplicationRecord
  belongs_to :hotel
  validates :name, uniqueness: { scope: :hotel_id,
                                 message: "should be unique." }
end
