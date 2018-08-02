class ChangeDifficultyToBeIntegerInReviews < ActiveRecord::Migration[5.1]
  def change
    change_column :reviews, :difficulty, :integer
  end
end
