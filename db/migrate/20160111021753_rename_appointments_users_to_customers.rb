class RenameAppointmentsUsersToCustomers < ActiveRecord::Migration
  def change
    rename_column(:appointments, :user_id, :customer_id)
  end
end
