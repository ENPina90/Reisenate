class CreateHotelBenefits < ActiveRecord::Migration[6.1]
  def change
    create_table :hotel_benefits do |t|
      t.references :room, null: false, foreign_key: true
      t.references :benefit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
