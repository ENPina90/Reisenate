class AddSpecialToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :special, :string
  end
end
