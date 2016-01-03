class User < ActiveRecord::Base
  has_many :appointments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader

  def admin?
    role == 'admin'
  end

  def guest?
    role == 'guest'
  end

  def vendor?
    role == 'vendor'
  end

  def client_paid?
    role = 'client_paid'
  end

end
