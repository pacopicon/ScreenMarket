class User < ActiveRecord::Base
  has_many :customer_appointments, class_name: 'Appointment', foreign_key: :customer_id
  has_many :vendor_appointments, class_name: 'Appointment', foreign_key: :vendor_id
  has_many :vendors, through: :vendor_appointments, dependent: :destroy, foreign_key: :vendor_id
  has_many :customers, through: :customer_appointments, dependent: :destroy, foreign_key: :customer_id
  belongs_to :office

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader

  def admin?
    role == 'vendor and customer and admin'
  end

  def guest?
    role == 'guest'
  end

  def vendor?
    role == 'vendor' || role == 'vendor and customer'
  end

  def customer?
    role == 'customer' || role == 'vendor and customer'
  end

end
