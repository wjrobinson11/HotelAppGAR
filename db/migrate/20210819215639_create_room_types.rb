class CreateRoomTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :room_types do |t|
      t.string :name
      t.boolean :available
      t.integer :hotel_id

      t.timestamps
    end
  end
end
