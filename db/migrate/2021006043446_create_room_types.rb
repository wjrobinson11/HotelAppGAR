class CreateRoomTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :room_types do |t|
      t.string :name
      t.boolean :available
      t.belongs_to :hotel
      t.timestamps
    end
  end
end