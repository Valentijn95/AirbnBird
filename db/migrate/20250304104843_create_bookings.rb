class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :bird, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status, default: "pending"
      t.date :start_date, null: false
      t.date :end_date

      t.timestamps
    end
  end
end
