class Appointment < ActiveRecord::Base
  belongs_to :customer, class_name: 'User', foreign_key: :customer_id
  belongs_to :vendor, class_name: 'User', foreign_key: :vendor_id

end
