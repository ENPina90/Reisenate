class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.string :location
      t.date :date
      t.integer :adults
      t.integer :children
      t.integer :rooms

      t.timestamps
    end
  end
end
