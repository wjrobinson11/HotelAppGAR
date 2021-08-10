class RoomType < ApplicationRecord
  belongs_to :hotel
  validates_uniqueness_of :name, scope: :hotel_id
end