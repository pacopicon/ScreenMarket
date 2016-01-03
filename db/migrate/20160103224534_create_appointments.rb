class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.datetime :time_of
      t.boolean :has_been_paid
      t.float :amount

      t.timestamps null: false
    end
  end
end
