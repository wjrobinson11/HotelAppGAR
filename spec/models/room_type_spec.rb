require 'rails_helper'

RSpec.describe RoomType, type: :model do
  # it { should validate_uniqueness_of(:name).scoped_to(:hotel_id)}

  context 'when the hotel is present' do
    let(:hotel) { Hotel.create(name: 'Test hotel') }

    it 'returns empty array for the room types' do
      expect(hotel.room_types).to eq([])
    end

    context 'when room type present' do
      let(:room_type) { RoomType.create(name: 'Test roomtype', available: true, hotel: hotel) }

      before { hotel.room_types= [room_type] }

      it 'returns the room type' do
        expect(hotel.room_types).to eq([room_type])
      end

      context 'when the room type name is not present for the hotel' do
        it 'should be valid' do
          expect(RoomType.new(name: 'Test roomtype one', available: true, hotel: hotel).valid?).to eq(true)
        end
      end

      context 'when the room type name is already present for the hotel' do
        it 'should not be valid' do
          expect(RoomType.new(name: 'Test roomtype', available: true, hotel: hotel).valid?).to eq(false)
        end
      end
    end
  end
end
