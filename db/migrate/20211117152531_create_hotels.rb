class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.references :city, null: false, foreign_key: true
      t.string :address
      t.string :brand
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
