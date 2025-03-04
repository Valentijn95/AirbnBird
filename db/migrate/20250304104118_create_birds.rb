class CreateBirds < ActiveRecord::Migration[7.1]
  def change
    create_table :birds do |t|
      t.references :user, null: false, foreign_key: true
      t.string :description
      t.integer :price
      t.string :title
      t.string :categories

      t.timestamps
    end
  end
end
