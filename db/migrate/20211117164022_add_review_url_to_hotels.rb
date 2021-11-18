class AddReviewUrlToHotels < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :review_url, :string
  end
end
