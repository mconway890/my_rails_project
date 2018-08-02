class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :recipe_id
      t.integer :user_id
      t.string :difficulty
      t.string :description

      t.timestamps
    end
  end
end
