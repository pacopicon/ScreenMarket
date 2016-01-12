class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :name
      t.datetime :time_of
      t.time :duration
      t.boolean :has_been_paid
      t.float :amount_per_half_hour
      t.references :user, index: true, foreign_key: true
      t.references :vendor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
