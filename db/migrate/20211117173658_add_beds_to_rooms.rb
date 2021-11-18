class AddBedsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :beds, :integer
  end
end
