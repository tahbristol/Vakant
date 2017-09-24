class User < ApplicationRecord
	validates :email, presence: true
	has_many :job_users
	has_many :jobs, through: :job_users
  has_secure_password

end
