class AddFieldOfExpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :field_of_exp, :string
  end
end
