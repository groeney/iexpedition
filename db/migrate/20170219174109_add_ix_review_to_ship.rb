class AddIxReviewToShip < ActiveRecord::Migration[5.0]
  def change
    add_column :ships, :ix_review, :text
  end
end
