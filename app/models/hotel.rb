class Hotel < ApplicationRecord
	has_many :room_types
	accepts_nested_attributes_for :room_types, allow_destroy: true
end
