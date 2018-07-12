class AddInstructionsToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :instructions, :text
  end
end
