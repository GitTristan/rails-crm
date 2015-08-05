class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  has_secure_password

  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships

  def full_name
    "#{first_name} #{last_name}"
  end

end
