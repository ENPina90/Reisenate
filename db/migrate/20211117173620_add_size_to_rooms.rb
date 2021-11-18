class AddSizeToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :size, :integer
  end
end
