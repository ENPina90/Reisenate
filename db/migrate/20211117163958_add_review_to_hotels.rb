class AddReviewToHotels < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :review, :text
  end
end
